---
title: "oop/basic_syntax.rb"
slug: oop-basic-syntax
description: "The metorex example program oop/basic_syntax.rb and its output."
---

`tests/_examples/oop/basic_syntax.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/basic_syntax.rb){target=_blank rel=noopener}.

```metorex
def setup_runtime
  log "Runtime starting"
end

class Dog < Animal
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def bark
    puts "#{@name} says woof!"
  end
end

dog = Dog.new("Fido", "Labrador")
dog.bark
```
