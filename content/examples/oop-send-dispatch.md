---
title: "oop/send/dispatch.rb"
slug: oop-send-dispatch
description: "The metorex example program oop/send/dispatch.rb and its output."
---

`tests/_examples/oop/send/dispatch.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/send/dispatch.rb){target=_blank rel=noopener}.

```metorex
# `send` and `__send__` name the method with a Symbol or a String, and say so
# when handed anything else.

class Greeter
  def greet
    "hello"
  end

  def self.build
    new
  end

  def collect(first, *rest)
    [first, *rest]
  end
end

puts Greeter.new.send(:greet)
puts Greeter.new.__send__("greet")
puts Greeter.send(:build).greet

puts Greeter.new.send(:collect, :one).inspect
puts Greeter.new.send(:collect, :one, :two).inspect

begin
  Greeter.new.send(42)
rescue TypeError => error
  puts error.message
end

begin
  Greeter.new.send
rescue ArgumentError => error
  puts error.message
end

begin
  Greeter.new.send(:missing)
rescue NoMethodError
  puts "NoMethodError for a name nothing defines"
end

puts BasicObject.instance_methods(false).sort.inspect
puts BasicObject.public_instance_methods(false).include?(:__send__).to_s

first_module = Module.new do
  def steps(taken)
    taken.push :first
  end
end

second_module = Module.new do
  def steps(taken = [])
    super(taken)
    taken.push :second
  end
end

layered = Class.new do
  include first_module
  include second_module
end

puts layered.new.steps.inspect
```

Output:

```
hello
hello
hello
[:one]
[:one, :two]
42 is not a symbol nor a string
no method name given
NoMethodError for a name nothing defines
[:!, :!=, :==, :__id__, :__send__, :equal?, :instance_eval, :instance_exec]
true
[:first, :second]
```
