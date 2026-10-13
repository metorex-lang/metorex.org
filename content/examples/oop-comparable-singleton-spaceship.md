---
title: "oop/comparable/singleton_spaceship.rb"
slug: oop-comparable-singleton-spaceship
description: "The metorex example program oop/comparable/singleton_spaceship.rb and its output."
---

`tests/_examples/oop/comparable/singleton_spaceship.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/comparable/singleton_spaceship.rb){target=_blank rel=noopener}.

```metorex
class Pair
  include Comparable

  def initialize(v)
    @v = v
  end

  def <=>(other)
    @v <=> other.instance_variable_get(:@v)
  end
end

a = Pair.new(5)
b = Pair.new(10)

a.singleton_class.class_eval do
  define_method(:<=>) { |other| 1 }
end

puts((a > b).inspect)
puts(a.send(:<=>, b))
```

Output:

```
true
1
```
