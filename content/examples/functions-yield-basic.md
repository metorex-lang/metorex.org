---
title: "functions/yield_basic.rb"
slug: functions-yield-basic
description: "The metorex example program functions/yield_basic.rb and its output."
---

`tests/_examples/functions/yield_basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/yield_basic.rb){target=_blank rel=noopener}.

```metorex
def greet(name)
  puts("before yield")
  yield name
  puts("after yield")
end

greet("Alice") do |n|
  puts("Hello, " + n)
end

def repeat(n)
  i = 0
  while i < n
    yield i
    i = i + 1
  end
end

repeat(3) do |x|
  puts(x)
end

def with_return_value
  result = yield 10
  puts(result)
end

with_return_value do |x|
  x * 2
end

def no_args_yield
  yield
end

no_args_yield do
  puts("yielded with no args")
end
```

Output:

```
before yield
Hello, Alice
after yield
0
1
2
20
yielded with no args
```
