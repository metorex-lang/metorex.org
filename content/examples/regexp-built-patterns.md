---
title: "regexp/built_patterns.rb"
slug: regexp-built-patterns
description: "The metorex example program regexp/built_patterns.rb and its output."
---

`tests/_examples/regexp/built_patterns.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/regexp/built_patterns.rb).

```metorex
# `Regexp.new` reads flags written as a number or as the letters a literal
# carries, refuses a pattern Ruby refuses, and reports the encoding the
# pattern is read in.
p Regexp.new("hi", Regexp::IGNORECASE).options
p Regexp.new("hi", "imx").options
p Regexp.new("hi").source.encoding
p Regexp.new("\u{3042}").encoding

begin
  Regexp.new "hi", "e"
rescue ArgumentError => problem
  puts problem.message
end

begin
  Regexp.new "^[$"
rescue RegexpError => problem
  puts problem.message
end

begin
  Regexp.new :symbol
rescue TypeError => problem
  puts problem.message
end

# A pattern written as a literal stays frozen however many built ones came
# and went before it.
100.times { Regexp.new "x" }
p(/after/.frozen?)
p Regexp.new("after").frozen?
```

Output:

```
1
7
#<Encoding:US-ASCII>
#<Encoding:UTF-8>
unknown regexp option: e
premature end of char-class: /^[$/
no implicit conversion of Symbol into String
true
false
```
