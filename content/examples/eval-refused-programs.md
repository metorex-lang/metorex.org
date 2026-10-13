---
title: "eval/refused_programs.rb"
slug: eval-refused-programs
description: "The metorex example program eval/refused_programs.rb and its output."
---

`tests/_examples/eval/refused_programs.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/eval/refused_programs.rb).

```metorex
# Code the interpreter could read but Ruby's grammar refuses raises a
# SyntaxError from eval, laid out as prism lays it out.
def report(source)
  eval(source)
rescue SyntaxError => error
  puts(error.message.sub(/\A\(eval at [^)]*\)/, "(eval)"))
end

report("1 2")
report("first = 1\nsecond = 2 3")
report("def pair(left, left); end")
total = 4
puts(eval("total -2"))
```

Output:

```
(eval):1: syntax error found
> 1 | 1 2
    |   ^ unexpected integer, expecting end-of-input
(eval):2: syntax error found
  1 | first = 1
> 2 | second = 2 3
    |            ^ unexpected integer, expecting end-of-input
(eval):1: syntax error found
> 1 | def pair(left, left); end
    |                ^~~~ duplicated argument name
2
```
