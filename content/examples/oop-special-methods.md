---
title: "oop/special_methods.rb"
slug: oop-special-methods
description: "The metorex example program oop/special_methods.rb and its output."
---

`tests/_examples/oop/special_methods.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/special_methods.rb){target=_blank rel=noopener}.

```metorex
class Book
  def initialize(title)
    @title = title
  end

  def to_s
    "Book: " + @title
  end

  def inspect
    "Book(title=" + @title + ")"
  end
end

class Magazine
  def initialize(name)
    @name = name
  end

  def inspect
    "Magazine: " + @name
  end
end

class SimpleIterator
  def initialize
    @value = 0
  end

  def each
    self
  end

  def next
    "next_value"
  end
end

book = Book.new("Ruby Guide")
puts book

magazine = Magazine.new("Tech Monthly")
p magazine

it = SimpleIterator.new
iterator = it.each
puts iterator.next
```

Output:

```
Book: Ruby Guide
Magazine: Tech Monthly
next_value
```
