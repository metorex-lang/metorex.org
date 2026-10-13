---
title: "ruby_vm/syntax_tree_sources.rb"
slug: ruby-vm-syntax-tree-sources
description: "The metorex example program ruby_vm/syntax_tree_sources.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_sources.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_sources.rb){target=_blank rel=noopener}.

```metorex
# RubyVM::AbstractSyntaxTree keeps a program's lines and tokens when asked
# to, so a node can answer the text it was written as and the tokens it
# covers. A program it refuses names the line at fault with a caret.
source = "total = price * 2\nputs(total) # report\n"

plain = RubyVM::AbstractSyntaxTree.parse(source)
p(plain.script_lines)
p(plain.source)
p(plain.tokens)
p(plain.all_tokens)

kept = RubyVM::AbstractSyntaxTree.parse(source, keep_script_lines: true)
p(kept.script_lines)
p(kept.source)
assignment = kept.children[2].children[0]
p(assignment.source)
p(assignment.children[1].source)
p(assignment.children[1].children[2].source)

tokened = RubyVM::AbstractSyntaxTree.parse(source, keep_tokens: true)
tokened.all_tokens.each { |token| p(token) }
p(tokened.children[2].children[1].tokens)

heredoc = RubyVM::AbstractSyntaxTree.parse("text = <<~END # note\n  line\nEND\n", keep_tokens: true)
heredoc.all_tokens.each { |token| p(token) }

def each_node(node, &visit)
  return unless node.is_a?(RubyVM::AbstractSyntaxTree::Node)

  visit.call(node)
  node.children.each { |child| each_node(child, &visit) }
end
ids = []
each_node(kept) { |node| ids << node.node_id }
p(ids.all?(Integer))
p(ids.uniq.size == ids.size)

[
  "break if ready",
  "retry",
  "next",
  "items.each { }; break 1",
  "if ready\n  break\nend",
  "class Report\n  return 1\nend",
  "def build\n  class Report; end\nend",
  "def build\n  Limit = 10\nend",
  "alias $first $1",
  "puts 'a' if a\n\n\nnext 1",
  "1 +",
  "total = price *\n",
  "x = 1\ny = ("
].each do |program|
  RubyVM::AbstractSyntaxTree.parse(program)
rescue SyntaxError => error
  p(error.message)
end
```

Output:

```
nil
nil
nil
nil
["total = price * 2\n", "puts(total) # report\n"]
"total = price * 2\nputs(total) "
"total = price * 2"
"price * 2"
"2"
[0, :tIDENTIFIER, "total", [1, 0, 1, 5]]
[1, :tSP, " ", [1, 5, 1, 6]]
[2, :"=", "=", [1, 6, 1, 7]]
[3, :tSP, " ", [1, 7, 1, 8]]
[4, :tIDENTIFIER, "price", [1, 8, 1, 13]]
[5, :tSP, " ", [1, 13, 1, 14]]
[6, :*, "*", [1, 14, 1, 15]]
[7, :tSP, " ", [1, 15, 1, 16]]
[8, :tINTEGER, "2", [1, 16, 1, 17]]
[9, :nl, "\n", [1, 17, 1, 18]]
[10, :tIDENTIFIER, "puts", [2, 0, 2, 4]]
[11, :"\"(\"", "(", [2, 4, 2, 5]]
[12, :tIDENTIFIER, "total", [2, 5, 2, 10]]
[13, :"\")\"", ")", [2, 10, 2, 11]]
[14, :tSP, " ", [2, 11, 2, 12]]
[15, :tCOMMENT, "# report\n", [2, 12, 2, 21]]
[[10, :tIDENTIFIER, "puts", [2, 0, 2, 4]], [11, :"\"(\"", "(", [2, 4, 2, 5]], [12, :tIDENTIFIER, "total", [2, 5, 2, 10]], [13, :"\")\"", ")", [2, 10, 2, 11]]]
[0, :tIDENTIFIER, "text", [1, 0, 1, 4]]
[1, :tSP, " ", [1, 4, 1, 5]]
[2, :"=", "=", [1, 5, 1, 6]]
[3, :tSP, " ", [1, 6, 1, 7]]
[4, :tHEREDOC_BEG, "<<~END", [1, 7, 1, 13]]
[5, :tSTRING_CONTENT, "  line\n", [2, 0, 2, 7]]
[6, :tHEREDOC_END, "END\n", [3, 0, 3, 4]]
[7, :tSP, " ", [1, 13, 1, 14]]
[8, :tCOMMENT, "# note\n", [1, 14, 1, 21]]
true
true
"Invalid break\nbreak if ready\n^~~~~\n"
"Invalid retry without rescue\nretry\n^~~~~\n"
"Invalid next"
"Invalid break\nitems.each { }; break 1\n                ^~~~~~~\n"
"Invalid break"
"Invalid return in class/module body\n  return 1\n  ^~~~~~\n"
"class definition in method body\n  class Report; end\n  ^~~~~~~~~~~~\n"
"dynamic constant assignment\n  Limit = 10\n  ^~~~~\n"
"can't make alias for the number variables\nalias $first $1\n             ^~\n"
"Invalid next\nnext 1\n^~~~~~\n"
"syntax error, unexpected end-of-input"
"syntax error, unexpected end-of-input\ntotal = price *\n               ^\n"
"syntax error, unexpected end-of-input\ny = (\n     ^\n"
```
