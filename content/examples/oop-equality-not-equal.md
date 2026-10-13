---
title: "oop/equality/not_equal.rb"
slug: oop-equality-not-equal
description: "The metorex example program oop/equality/not_equal.rb and its output."
---

`tests/_examples/oop/equality/not_equal.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/equality/not_equal.rb){target=_blank rel=noopener}.

```metorex
# `!=` is the negation of `==`, so defining only `==` gives a class both.

class Tagged
  attr_reader :tag

  def initialize(tag)
    @tag = tag
  end

  def ==(other)
    other.is_a?(Tagged) && tag == other.tag
  end
end

first = Tagged.new(:a)
same = Tagged.new(:a)
other = Tagged.new(:b)

puts (first == same).to_s
puts (first != same).to_s
puts (first != other).to_s
puts first.send(:!=, same).to_s
puts first.send(:!=, other).to_s

# A class whose `==` always answers true is never unequal.
class AlwaysEqual
  def ==(other)
    true
  end
end

always = AlwaysEqual.new
puts (always != 1).to_s
puts (always != "anything").to_s

# Without a definition, `!=` falls back to identity for plain objects.
plain = Object.new
puts (plain != plain).to_s
puts (plain != Object.new).to_s
```

Output:

```
true
false
true
false
true
false
false
false
true
```
