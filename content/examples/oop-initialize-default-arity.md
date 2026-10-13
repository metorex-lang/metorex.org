---
title: "oop/initialize/default_arity.rb"
slug: oop-initialize-default-arity
description: "The metorex example program oop/initialize/default_arity.rb and its output."
---

`tests/_examples/oop/initialize/default_arity.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/initialize/default_arity.rb){target=_blank rel=noopener}.

```metorex
# The default `initialize` takes no arguments, so handing `new` any is an
# ArgumentError rather than a silent no-op.

class Plain
end

plain = Plain.new
puts plain.class.to_s

begin
  Plain.new(1, 2)
rescue ArgumentError => error
  puts error.message
end

begin
  BasicObject.new("extra")
rescue ArgumentError => error
  puts error.message
end

puts BasicObject.private_instance_methods(false).include?(:initialize).to_s

class Accepting
  def initialize(first, second = 2)
    @pair = [first, second]
  end

  attr_reader :pair
end

puts Accepting.new(1).pair.inspect
puts Accepting.new(1, 9).pair.inspect

begin
  Accepting.new
rescue ArgumentError => error
  puts error.message
end

class Variadic
  def initialize(first, *rest)
    @all = [first, *rest]
  end

  attr_reader :all
end

puts Variadic.new(1, 2, 3).all.inspect

begin
  Variadic.new
rescue ArgumentError => error
  puts error.message
end

adder = lambda { |first, second| first + second }
begin
  adder.call 1
rescue ArgumentError => error
  puts error.message
end

optional = lambda { |first, second = 2| [first, second] }
begin
  optional.call 1, 2, 3
rescue ArgumentError => error
  puts error.message
end
```

Output:

```
Plain
wrong number of arguments (given 2, expected 0)
wrong number of arguments (given 1, expected 0)
true
[1, 2]
[1, 9]
wrong number of arguments (given 0, expected 1..2)
[1, 2, 3]
wrong number of arguments (given 0, expected 1+)
wrong number of arguments (given 1, expected 2)
wrong number of arguments (given 3, expected 1..2)
```
