---
title: "methods/keyword_args/class.rb"
slug: methods-keyword-args-class
description: "The metorex example program methods/keyword_args/class.rb and its output."
---

`tests/_examples/methods/keyword_args/class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/keyword_args/class.rb){target=_blank rel=noopener}.

```metorex
class Person
  def initialize(name:, age: 0)
    @name = name
    @age = age
  end

  def introduce
    puts "I'm #{@name}, age #{@age}"
  end
end

p1 = Person.new(name: "Alice")
p1.introduce

p2 = Person.new(name: "Bob", age: 30)
p2.introduce
```

Output:

```
I'm Alice, age 0
I'm Bob, age 30
```
