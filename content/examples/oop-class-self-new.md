---
title: "oop/class/self_new.rb"
slug: oop-class-self-new
description: "The metorex example program oop/class/self_new.rb and its output."
---

`tests/_examples/oop/class/self_new.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/class/self_new.rb){target=_blank rel=noopener}.

```metorex
class Foo
  def initialize
    @x = 42
    puts "init called, @x=#{@x}"
  end

  def self.make
    puts "make: self=#{self}"
    inst = new
    puts "make: inst.class=#{inst.class}"
    inst
  end
end

f = Foo.make
puts "f.class=#{f.class}"
```

Output:

```
make: self=Foo
init called, @x=42
make: inst.class=Foo
f.class=Foo
```
