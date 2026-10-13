---
title: "site/home.rb"
slug: site-home
description: "The metorex example program site/home.rb and its output."
---

`tests/_examples/site/home.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/home.rb).

```metorex
Point = Struct.new(:x, :y) do
  def +(other) = Point.new(x + other.x, y + other.y)
end

total = [Point.new(1, 2), Point.new(3, 4)].sum(Point.new(0, 0))
puts total.inspect

case total
in { x: Integer => x, y: } if y > x
  puts "y leads by #{y - x}"
end
```

Output:

```
#<struct Point x=4, y=6>
y leads by 2
```
