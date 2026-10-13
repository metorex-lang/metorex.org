---
title: "oop/operator_methods/index.rb"
slug: oop-operator-methods-index
description: "The metorex example program oop/operator_methods/index.rb and its output."
---

`tests/_examples/oop/operator_methods/index.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/operator_methods/index.rb){target=_blank rel=noopener}.

```metorex
class Grid
  def initialize(width, height)
    @width = width
    @height = height
    @data = []
    i = 0
    while i < width * height
      @data.push(0)
      i = i + 1
    end
  end

  def [](index)
    @data[index]
  end

  def []=(index, value)
    @data[index] = value
  end
end

g = Grid.new(3, 3)
g[0] = 42
g[4] = 99

puts g[0]
puts g[4]
puts g[1]
```

Output:

```
42
99
0
```
