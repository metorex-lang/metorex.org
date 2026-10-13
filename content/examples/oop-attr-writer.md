---
title: "oop/attr/writer.rb"
slug: oop-attr-writer
description: "The metorex example program oop/attr/writer.rb and its output."
---

`tests/_examples/oop/attr/writer.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/attr/writer.rb){target=_blank rel=noopener}.

```metorex
class Person
  attr_writer :name, :age
  attr_reader :name, :age

  def initialize
    @name = "Unknown"
    @age = 0
  end
end

p = Person.new
puts p.name
puts p.age
p.name = "Bob"
p.age = 25
puts p.name
puts p.age
```

Output:

```
Unknown
0
Bob
25
```
