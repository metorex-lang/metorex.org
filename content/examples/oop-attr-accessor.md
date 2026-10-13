---
title: "oop/attr/accessor.rb"
slug: oop-attr-accessor
description: "The metorex example program oop/attr/accessor.rb and its output."
---

`tests/_examples/oop/attr/accessor.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/attr/accessor.rb){target=_blank rel=noopener}.

```metorex
class Person
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
    @name = name
    @age = age
    @email = email
  end
end

p = Person.new("Charlie", 35, "charlie@example.com")
puts p.name
puts p.age
puts p.email
p.name = "Charles"
p.age = 36
p.email = "charles@example.com"
puts p.name
puts p.age
puts p.email
```

Output:

```
Charlie
35
charlie@example.com
Charles
36
charles@example.com
```
