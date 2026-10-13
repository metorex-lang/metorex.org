# Run under MRI. Reads lines of `Owner<TAB>#|.<TAB>name` and writes, for each,
# the first sentence of the method's documentation in MRI's ri data, as
# Markdown, or an empty line when ri has none.
require "rdoc"

STORE = RDoc::Store.new(RDoc::Options.new, path: RDoc::RI::Paths.system_dir, type: :system)
STORE.load_cache
TO_MARKDOWN = RDoc::Markup::ToMarkdown.new

def documented(owner, kind, name, seen = [])
  method = STORE.load_method(owner, "#{kind == "#" ? "#" : "::"}#{name}")
  return documented(owner, kind, method.is_alias_for.name, seen + [name]) if
    method.comment.empty? && method.is_alias_for && !seen.include?(method.is_alias_for.name)

  method
rescue RDoc::Store::MissingFileError
  nil
end

def first_sentence(method)
  return "" unless method

  document = method.comment.is_a?(RDoc::Markup::Document) ? method.comment : method.comment.parse
  at = document.parts.index { |part| part.is_a?(RDoc::Markup::Paragraph) }
  return "" unless at

  text = TO_MARKDOWN.convert(RDoc::Markup::Document.new(document.parts[at])).gsub(/\s+/, " ").strip
  # A paragraph such as "Equivalent to" leads into the code that follows it.
  following = document.parts[(at + 1)..].find { |part| !part.is_a?(RDoc::Markup::BlankLine) }
  if text !~ /[.!?:]\z/ && following.is_a?(RDoc::Markup::Verbatim)
    text = "#{text} `#{following.text.lines.first.strip}`."
  end
  sentence = text[/\A.*?[.!?](?=\s|\z)/m] || text
  # A link into Ruby's own documentation tree has no page here, so only its
  # text is kept.
  sentence.gsub(/\[([^\]]*)\]\((?!https?:)[^)]*\)/, '\1')
end

# The name ri files `owner` under: `Queue` is `Thread::Queue` there.
def filed_name(owner)
  names = STORE.module_names
  names.include?(owner) ? owner : names.find { |name| name.end_with?("::#{owner}") } || owner
end

# The method's documentation, looked for on the owner and then on each of its
# ancestors, as ri does for `Rational#%`, which is documented on Numeric. ri
# files the methods of an object such as ARGF, which ruby/spec describes as
# `ARGF.argv`, among its instance methods, so the other kind is tried too.
def lookup(owner, kind, name)
  queue = [filed_name(owner)]
  seen = []
  until queue.empty?
    current = queue.shift
    next if seen.include?(current)

    seen << current
    found = documented(current, kind, name) || documented(current, kind == "#" ? "." : "#", name)
    return found if found

    queue.concat(Array(STORE.ancestors[current]))
  end
  nil
end

STDIN.each_line do |line|
  owner, kind, name = line.chomp.split("\t", 3)
  puts first_sentence(lookup(owner, kind, name))
end
