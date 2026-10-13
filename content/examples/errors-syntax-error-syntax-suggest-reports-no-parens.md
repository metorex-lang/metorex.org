---
title: "errors/syntax_error/syntax_suggest_reports_no_parens.rb"
slug: errors-syntax-error-syntax-suggest-reports-no-parens
description: "The metorex example program errors/syntax_error/syntax_suggest_reports_no_parens.rb and its output."
---

`tests/_examples/errors/syntax_error/syntax_suggest_reports_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/syntax_error/syntax_suggest_reports_no_parens.rb).

```metorex
require "stringio"
require "syntax_suggest/api"

# A search slower than the default second, as on a loaded machine, would
# leave `detailed_message` without its annotation.
SyntaxSuggest.send :remove_const, :TIMEOUT_DEFAULT
SyntaxSuggest.const_set :TIMEOUT_DEFAULT, 60

p defined?(SyntaxSuggest)

["missing_end.rb", "extra_end.rb"].each do |name|
  path = File.join(__dir__, name)
  io = StringIO.new
  require "syntax_suggest/api"
  SyntaxSuggest.call io: io, source: File.read(path), filename: name, terminal: false, timeout: 60
  puts io.string
  begin
    load path
  rescue SyntaxError => error
    annotation = io.string.sub name, path
    p error.detailed_message(highlight: false).start_with?(annotation)
    p error.detailed_message(highlight: false, syntax_suggest: false).include?("-->")
  end
end

p SyntaxSuggest.valid?("def total\nend\n")
p SyntaxSuggest.invalid? ["def total\n", "  def tax\n", "end\n"]
```

Output:

```
"constant"
--> missing_end.rb

Unmatched keyword, missing `end' ?

  2  class Kennel
> 3    def admit(dog)
> 6    def release(dog)
> 8    end
  9  end
true
false
--> extra_end.rb

Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

  2  def invoice_total(items)
> 3    items.sum(&:price)
> 4    end
  5  end
true
false
true
true
```
