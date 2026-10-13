---
title: "functions/lambda_parenless_arg.rb"
slug: functions-lambda-parenless-arg
description: "The metorex example program functions/lambda_parenless_arg.rb and its output."
---

`tests/_examples/functions/lambda_parenless_arg.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/lambda_parenless_arg.rb).

```metorex
def guard(condition)
  yield if condition.call
end

guard -> { true } do
  puts "ran without parentheses"
end

guard(-> { true }) do
  puts "ran with parentheses"
end

guard -> { false } do
  puts "skipped"
end

def apply(fn, value)
  fn.call value
end

puts apply -> n { n * 2 }, 21
puts apply(-> n { n * 2 }, 21)
```

Output:

```
ran without parentheses
ran with parentheses
42
42
```
