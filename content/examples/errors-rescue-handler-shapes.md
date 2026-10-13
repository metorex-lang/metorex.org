---
title: "errors/rescue_handler_shapes.rb"
slug: errors-rescue-handler-shapes
description: "The metorex example program errors/rescue_handler_shapes.rb and its output."
---

`tests/_examples/errors/rescue_handler_shapes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/rescue_handler_shapes.rb){target=_blank rel=noopener}.

```metorex
handled = [ArgumentError, TypeError]
puts((begin
  raise(TypeError, "wrong")
rescue RuntimeError, *handled
  :caught
end).to_s)

chooser = Class.new
def chooser.===(error)
  error.message == "mine"
end
puts((begin
  raise("mine")
rescue chooser
  :by_case_equality
rescue RuntimeError
  :by_class
end).to_s)

not_a_class = 42
begin
  begin
    raise("stopped")
  rescue not_a_class
    :never
  end
rescue TypeError => error
  puts(error.message)
end

class Holder
  attr_accessor :captured
end
held = Holder.new
begin
  raise("held")
rescue RuntimeError => held.captured
end
puts(held.captured.message)

begin
  raise("global")
rescue RuntimeError => $captured
end
puts($captured.message)

first, second = raise rescue [1, 2]
puts([first, second].inspect)

["begin\n 1\nelse\n 2\nend", "1.+(1 rescue 1)", "a = 1 rescue RuntimeError 2"].each do |source|
  begin
    eval(source)
    puts("no error")
  rescue SyntaxError
    puts("SyntaxError")
  end
end
```

Output:

```
caught
by_case_equality
class or module required for rescue clause
held
global
[1, 2]
SyntaxError
SyntaxError
SyntaxError
```
