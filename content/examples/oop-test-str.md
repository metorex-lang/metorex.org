---
title: "oop/test/str.rb"
slug: oop-test-str
description: "The metorex example program oop/test/str.rb and its output."
---

`tests/_examples/oop/test/str.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/test/str.rb).

```metorex
class Person
  def initialize(name)
    @name = name
  end

  def to_s
    "Person: " + @name
  end
end

person = Person.new("Alice")
puts person
```

Output:

```
Person: Alice
```
