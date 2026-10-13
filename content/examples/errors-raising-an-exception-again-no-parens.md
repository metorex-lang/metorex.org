---
title: "errors/raising_an_exception_again_no_parens.rb"
slug: errors-raising-an-exception-again-no-parens
description: "The metorex example program errors/raising_an_exception_again_no_parens.rb and its output."
---

`tests/_examples/errors/raising_an_exception_again_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/raising_an_exception_again_no_parens.rb).

```metorex
# `raise error, message` asks the exception for a copy carrying the new
# message, which keeps the backtrace it was raised with. A trace sees the
# raise however it was written.
def fail_deep
  raise ArgumentError, "first"
end

def wrap
  fail_deep
rescue => error
  raise error, "second (#{error.message})"
end

begin
  wrap
rescue => error
  p error.message
  puts error.backtrace.map { |line| line.sub(/\A.*\.rb:/, "") }
end

seen = []
tracer = TracePoint.new(:raise) { |point| seen << point.raised_exception.message }
tracer.enable
begin
  raise(TypeError, "written with parentheses")
rescue TypeError
end
begin
  raise TypeError, "written without"
rescue TypeError
end
tracer.disable
p seen
```

Output:

```
"second (first)"
5:in 'Object#fail_deep'
9:in 'Object#wrap'
15:in '<main>'
["written with parentheses", "written without"]
```
