---
title: "regexp/pattern_soundness_parens.rb"
slug: regexp-pattern-soundness-parens
description: "The metorex example program regexp/pattern_soundness_parens.rb and its output."
---

`tests/_examples/regexp/pattern_soundness_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/regexp/pattern_soundness_parens.rb).

```metorex
# A pattern has to close every group it opens.
begin
  Regexp.new("(hay(st)ack")
rescue RegexpError => error
  puts(error.message)
end

begin
  Regexp.new("hay)stack")
rescue RegexpError => error
  puts(error.message)
end

# A group's name is a name, so it cannot open with a digit or a minus.
begin
  Regexp.new("(?<1a>a)")
rescue RegexpError => error
  puts(error.message)
end

begin
  Regexp.new("(?<-a>a)")
rescue RegexpError => error
  puts(error.message)
end

# Only the three letters that change how a pattern reads name an option to
# `Regexp.new`, whatever a literal may be written with.
begin
  Regexp.new("Hi", "n")
rescue ArgumentError => error
  puts(error.message)
end

p(Regexp.new("Hi", "mx").source)
```

Output:

```
end pattern with unmatched parenthesis: /(hay(st)ack/
unmatched close parenthesis: /hay)stack/
invalid group name <1a>: /(?<1a>a)/
invalid group name <-a>: /(?<-a>a)/
unknown regexp option: n
"Hi"
```
