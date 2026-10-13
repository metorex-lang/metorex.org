---
title: "oop/singleton_on_variable.rb"
slug: oop-singleton-on-variable
description: "The metorex example program oop/singleton_on_variable.rb and its output."
---

`tests/_examples/oop/singleton_on_variable.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/singleton_on_variable.rb){target=_blank rel=noopener}.

```metorex
class Box
  def initialize
    @item = Object.new

    def @item.special
      "the one"
    end
  end

  def item
    @item
  end
end

puts Box.new.item.special

$stream = Object.new

def $stream.write(text)
  "wrote #{text}"
end

puts $stream.write "data"

plain = Object.new
puts plain.respond_to?(:special)
```

Output:

```
the one
wrote data
false
```
