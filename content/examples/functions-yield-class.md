---
title: "functions/yield_class.rb"
slug: functions-yield-class
description: "The metorex example program functions/yield_class.rb and its output."
---

`tests/_examples/functions/yield_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/yield_class.rb).

```metorex
class MyArray
  def initialize
    @items = [10, 20, 30]
  end

  def each
    i = 0
    while i < @items.length
      yield @items[i]
      i = i + 1
    end
  end

  def map
    result = []
    i = 0
    while i < @items.length
      result << yield(@items[i])
      i = i + 1
    end
    result
  end
end

arr = MyArray.new

arr.each do |x|
  puts(x)
end

mapped = arr.map do |x|
  x * 2
end
puts(mapped)
```

Output:

```
10
20
30
20
40
60
```
