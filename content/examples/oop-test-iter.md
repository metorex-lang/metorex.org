---
title: "oop/test/iter.rb"
slug: oop-test-iter
description: "The metorex example program oop/test/iter.rb and its output."
---

`tests/_examples/oop/test/iter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/test/iter.rb){target=_blank rel=noopener}.

```metorex
class Counter
  def initialize
    @count = 0
  end

  def each
    self
  end

  def next
    "next"
  end
end

counter = Counter.new
iterator = counter.each
puts iterator.next
```

Output:

```
next
```
