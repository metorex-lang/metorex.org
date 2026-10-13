---
title: "oop/test/repr.rb"
slug: oop-test-repr
description: "The metorex example program oop/test/repr.rb and its output."
---

`tests/_examples/oop/test/repr.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/test/repr.rb).

```metorex
class Point
  def initialize
    @x = 0
  end

  def inspect
    "Point(0, 0)"
  end
end

point = Point.new
p point
```

Output:

```
Point(0, 0)
```
