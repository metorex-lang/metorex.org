---
title: "methods/eql_and_array_difference.rb"
slug: methods-eql-and-array-difference
description: "The metorex example program methods/eql_and_array_difference.rb and its output."
---

`tests/_examples/methods/eql_and_array_difference.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/eql_and_array_difference.rb){target=_blank rel=noopener}.

```metorex
class Receipt
end

class Line
  attr_reader :index

  def initialize(index)
    @index = index
  end

  def <=>(other)
    index <=> other.index
  end
end

receipt = Receipt.new
p(receipt.eql?(receipt))
p(receipt.eql?(Receipt.new))
lines = [Line.new(1), Line.new(2), Line.new(3)]
p((lines - [lines[1]]).map(&:index))
Point = Struct.new(:x, :y)
p(Point.new(1, 2).eql?(Point.new(1, 2)))
p([Point.new(1, 2), Point.new(3, 4)] - [Point.new(1, 2)])
Size = Data.define(:width)
p(Size.new(width: 3).eql?(Size.new(width: 3)))
```

Output:

```
true
false
[1, 3]
true
[#<struct Point x=3, y=4>]
true
```
