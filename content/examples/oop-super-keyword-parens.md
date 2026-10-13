---
title: "oop/super/keyword_parens.rb"
slug: oop-super-keyword-parens
description: "The metorex example program oop/super/keyword_parens.rb and its output."
---

`tests/_examples/oop/super/keyword_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/super/keyword_parens.rb).

```metorex
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts("#{@name} makes a sound")
  end

  def describe
    "Animal: #{@name}"
  end
end

class Dog < Animal
  def initialize(name, breed)
    super(name)
    @breed = breed
  end

  def speak
    super
    puts("#{@name} barks")
  end

  def describe
    super + ", Breed: #{@breed}"
  end
end

d = Dog.new("Rex", "Labrador")
d.speak
puts(d.describe)
```

Output:

```
Rex makes a sound
Rex barks
Animal: Rex, Breed: Labrador
```
