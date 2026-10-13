---
title: "oop/module/modules_parens.rb"
slug: oop-module-modules-parens
description: "The metorex example program oop/module/modules_parens.rb and its output."
---

`tests/_examples/oop/module/modules_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module/modules_parens.rb){target=_blank rel=noopener}.

```metorex
module Greetable
  def greet
    puts("Hello, I am #{@name}")
  end

  def farewell
    puts("Goodbye from #{@name}")
  end
end

module ClassMethods
  def description
    puts("I am a class with module methods")
  end
end

class Person
  include Greetable
  extend ClassMethods

  def initialize(name)
    @name = name
  end
end

p = Person.new("Alice")
p.greet
p.farewell
Person.description
```

Output:

```
Hello, I am Alice
Goodbye from Alice
I am a class with module methods
```
