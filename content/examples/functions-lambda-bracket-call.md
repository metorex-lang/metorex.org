---
title: "functions/lambda_bracket_call.rb"
slug: functions-lambda-bracket-call
description: "The metorex example program functions/lambda_bracket_call.rb and its output."
---

`tests/_examples/functions/lambda_bracket_call.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/lambda_bracket_call.rb).

```metorex
add = lambda { |a, b| a + b }
puts(add[3, 4])
puts(add.call(10, 20))

double = lambda { |x| x * 2 }
puts(double[21])

no_args = lambda { 99 }
puts(no_args[])
```

Output:

```
7
30
42
99
```
