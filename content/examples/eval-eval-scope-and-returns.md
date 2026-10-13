---
title: "eval/eval_scope_and_returns.rb"
slug: eval-eval-scope-and-returns
description: "The metorex example program eval/eval_scope_and_returns.rb and its output."
---

`tests/_examples/eval/eval_scope_and_returns.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/eval/eval_scope_and_returns.rb).

```metorex
# What eval does with the scope around it: the class a definition lands in,
# the self the code runs against, the block the call was written with, and
# the way a return travels out.

class Cabinet
  def stock
    eval("class Shelf; end")
    Shelf.name
  end
end

p(Cabinet.new.stock)

p(Kernel.eval("self"))
p(Kernel.respond_to?(:eval))
p(method(:eval).call("2 * 3"))

class Speaker
  def self.say
    yield
  end
end

begin
  eval("Speaker.say") { "from the block" }
rescue LocalJumpError => refused
  p(refused.class)
end

answer = -> do
  proc do
    eval("return :from_the_eval")
  end.call
  :never_reached
end.call
p(answer)

begin
  proc { eval("return :nowhere") }.call
rescue LocalJumpError => stranded
  p(stranded.class)
end

held = binding
eval("if false; counted = 1; end", held)
p(eval("counted", held))

source = <<SOURCE.b
# encoding: UTF-8
class Cabinet
  Widthπ = 12
end
SOURCE
p(source.encoding)
eval(source)
p(Cabinet.constants(false).include?(:"Widthπ"))
p(Cabinet::Widthπ)

class Coerced
  def to_str
    "6 * 7"
  end
end

p(eval(Coerced.new))

begin
  eval("1", proc {})
rescue TypeError => refused
  p(refused.message)
end
```

Output:

```
"Cabinet::Shelf"
Kernel
true
6
LocalJumpError
:from_the_eval
LocalJumpError
nil
#<Encoding:BINARY (ASCII-8BIT)>
true
12
42
"wrong argument type proc (expected binding)"
```
