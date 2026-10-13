---
title: "control_flow/break_inside_expression_no_parens.rb"
slug: control-flow-break-inside-expression-no-parens
description: "The metorex example program control_flow/break_inside_expression_no_parens.rb and its output."
---

`tests/_examples/control_flow/break_inside_expression_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/break_inside_expression_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A `break` written inside an expression in the block of a built-in
# iterator ends that iterator with the value it carries, as one written as
# a statement does.
picked = [1, 2, 3].each { |number| number == 2 ? (break :middle) : number }
p picked

counted = 5.times { |index| index > 1 && (break index * 10) }
p counted

doubled = [4, 5, 6].map { |number| [number == 5 ? (break :stopped) : number] }
p doubled

nested = [1, 2].map do |outer|
  [10, 20].each { |inner| inner == 20 ? (break) : inner }
  outer
end
p nested
```

Output:

```
:middle
20
:stopped
[1, 2]
```
