---
title: "site/language_struct.rb"
slug: site-language-struct
description: "The metorex example program site/language_struct.rb and its output."
---

`tests/_examples/site/language_struct.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/language_struct.rb).

```metorex
Point = Struct.new(:x, :y) do
  def distance_to(other)
    Math.sqrt((x - other.x)**2 + (y - other.y)**2)
  end
end

a = Point.new(0, 0)
b = Point.new(3, 4)
p a.distance_to(b)
p b.to_a
p b == Point.new(3, 4)

Coordinate = Data.define(:latitude, :longitude)
here = Coordinate.new(latitude: 36.16, longitude: -86.78)
p here
p here.with(latitude: 40.71)
```

Output:

```
5.0
[3, 4]
true
#<data Coordinate latitude=36.16, longitude=-86.78>
#<data Coordinate latitude=40.71, longitude=-86.78>
```
