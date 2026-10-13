---
title: "control_flow/case_type_custom_class.rb"
slug: control-flow-case-type-custom-class
description: "The metorex example program control_flow/case_type_custom_class.rb and its output."
---

`tests/_examples/control_flow/case_type_custom_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_type_custom_class.rb){target=_blank rel=noopener}.

```metorex
# Type pattern matching with custom classes

class Dog
  def initialize(name)
    @name = name
  end

  def bark
    puts "#{@name} says woof!"
  end
end

class Cat
  def initialize(name)
    @name = name
  end

  def meow
    puts "#{@name} says meow!"
  end
end

# Test with Dog instance
animal = Dog.new("Buddy")
case animal
when Dog
  puts "It's a dog!"
  animal.bark
when Cat
  puts "It's a cat!"
  animal.meow
else
  puts "Unknown animal"
end

# Test with Cat instance
animal = Cat.new("Whiskers")
case animal
when Dog
  puts "It's a dog!"
  animal.bark
when Cat
  puts "It's a cat!"
  animal.meow
else
  puts "Unknown animal"
end

# Test with non-class value
animal = "not an animal"
case animal
when Dog
  puts "It's a dog!"
when Cat
  puts "It's a cat!"
when String
  puts "It's just a string"
else
  puts "Unknown type"
end
```

Output:

```
It's a dog!
Buddy says woof!
It's a cat!
Whiskers says meow!
It's just a string
```
