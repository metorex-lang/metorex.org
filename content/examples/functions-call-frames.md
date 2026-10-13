---
title: "functions/call_frames.rb"
slug: functions-call-frames
description: "The metorex example program functions/call_frames.rb and its output."
---

`tests/_examples/functions/call_frames.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/call_frames.rb){target=_blank rel=noopener}.

```metorex
def double(n)
  n * 2
end

def apply_twice(value)
  double(double(value))
end

def factorial(n)
  if n < 2
    return 1
  end
  n * factorial(n - 1)
end

result = apply_twice(4)
puts "apply_twice(4) = #{result}"
puts "factorial(6) = #{factorial(6)}"
```
