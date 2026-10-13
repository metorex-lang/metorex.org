---
title: "syntax/refused_forms_no_parens.rb"
slug: syntax-refused-forms-no-parens
description: "The metorex example program syntax/refused_forms_no_parens.rb and its output."
---

`tests/_examples/syntax/refused_forms_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/refused_forms_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Forms Ruby's grammar does not accept raise SyntaxError when the code is
# read, and a range that ends its line takes its end from the next line.
[
  "->(x) x + 1",
  "-> 42",
  "add_ten = x -> x + 10",
  "add = (x, y) -> x + y",
  "def skipped *\nend",
  "def skipped **\nend",
  "def skipped &\nend",
  "match 1\nwhen 1\nend",
  "-> { |x| x }",
  "-> do |x| x end",
  "->(x) { x + 1 }",
  "def kept *; end",
  "def kept *\nrest\nend"
].each do |source|
  eval source
  puts "read     #{source.inspect}"
rescue SyntaxError
  puts "refused  #{source.inspect}"
end

span = 1..
  2
p span
p (3..
)
```

Output:

```
refused  "->(x) x + 1"
refused  "-> 42"
refused  "add_ten = x -> x + 10"
refused  "add = (x, y) -> x + y"
refused  "def skipped *\nend"
refused  "def skipped **\nend"
refused  "def skipped &\nend"
refused  "match 1\nwhen 1\nend"
refused  "-> { |x| x }"
refused  "-> do |x| x end"
read     "->(x) { x + 1 }"
read     "def kept *; end"
read     "def kept *\nrest\nend"
1..2
3..
```
