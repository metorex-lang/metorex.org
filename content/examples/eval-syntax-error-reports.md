---
title: "eval/syntax_error_reports.rb"
slug: eval-syntax-error-reports
description: "The metorex example program eval/syntax_error_reports.rb and its output."
---

`tests/_examples/eval/syntax_error_reports.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/eval/syntax_error_reports.rb).

```metorex
# Code `eval` refuses raises a SyntaxError laid out as prism lays it out:
# each line at fault marked with `>`, the lines around it, and a run of
# carets under the part at fault with what is wrong there.
def report(source, *where)
  eval(source, binding, *where)
rescue SyntaxError => error
  puts(error.message.sub(/\A\(eval at [^)]*\)/, "(eval)"))
end

report("proc { _1 = 0 }")
report("x = 1 +")
report("first\nsecond\nthird\nvalue = = 1\nfourth\nfifth")
report("total = 'a long string that runs on past the caret' + + ) + 1")
report("ä = 1 +")
report("1 +", "named.rb", 10)
```

Output:

```
(eval):1: syntax error found
> 1 | proc { _1 = 0 }
    |        ^~ _1 is reserved for numbered parameters
(eval):1: syntax errors found
> 1 | x = 1 +
    |        ^ unexpected end-of-input, assuming it is closing the parent top level context
    |        ^ unexpected end-of-input; expected an expression after the operator
(eval):4: syntax errors found
  2 | second
  3 | third
> 4 | value = = 1
    |       ^ expected an expression after `=`
    |         ^ unexpected '='; target cannot be written
    |           ^ unexpected integer, expecting end-of-input
  5 | fourth
  6 | fifth
(eval):1: syntax errors found
> 1 | ... + ) + 1
    |     ^ unexpected ')', expected a receiver for unary `+`
    |       ^ unexpected ')', ignoring it
    |       ^ unexpected ')', expecting end-of-input
    |         ^ unexpected '+', ignoring it
(eval):1: syntax errors found
> 1 | ä = 1 +
    |        ^ unexpected end-of-input, assuming it is closing the parent top level context
    |        ^ unexpected end-of-input; expected an expression after the operator
named.rb:10: syntax errors found
> 10 | 1 +
     |    ^ unexpected end-of-input, assuming it is closing the parent top level context
     |    ^ unexpected end-of-input; expected an expression after the operator
```
