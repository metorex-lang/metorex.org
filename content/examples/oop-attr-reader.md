---
title: "oop/attr/reader.rb"
slug: oop-attr-reader
description: "The metorex example program oop/attr/reader.rb and its output."
---

`tests/_examples/oop/attr/reader.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/attr/reader.rb).

```metorex
class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

p = Person.new("Alice", 30)
puts p.name
puts p.age
```

Output:

```
Alice
30
```
