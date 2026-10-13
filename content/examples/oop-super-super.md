---
title: "oop/super/super.rb"
slug: oop-super-super
description: "The metorex example program oop/super/super.rb and its output."
---

`tests/_examples/oop/super/super.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/super/super.rb){target=_blank rel=noopener}.

```metorex
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    "Some sound"
  end

  def describe
    "I am an animal"
  end

  attr_reader :name
end

class Dog < Animal
  def initialize(name, breed)
    super(name)
    @breed = breed
  end

  def speak
    parent_sound = super()
    parent_sound + " -> Woof!"
  end

  def describe
    parent_desc = super()
    parent_desc + " named " + @name
  end

  attr_reader :breed
end

dog = Dog.new("Buddy", "Golden Retriever")
puts dog.name
puts dog.breed
puts dog.speak
puts dog.describe
```
