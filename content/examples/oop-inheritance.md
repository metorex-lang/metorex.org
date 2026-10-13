---
title: "oop/inheritance.rb"
slug: oop-inheritance
description: "The metorex example program oop/inheritance.rb and its output."
---

`tests/_examples/oop/inheritance.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/inheritance.rb).

```metorex
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    "Some sound"
  end

  def introduce
    @name + " says " + speak
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

class Cat < Animal
  def speak
    "Meow!"
  end
end

dog = Dog.new("Buddy")
cat = Cat.new("Whiskers")

puts dog.introduce
puts cat.introduce
```
