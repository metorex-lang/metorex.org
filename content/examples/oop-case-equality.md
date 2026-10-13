---
title: "oop/case_equality.rb"
slug: oop-case-equality
description: "The metorex example program oop/case_equality.rb and its output."
---

`tests/_examples/oop/case_equality.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/case_equality.rb){target=_blank rel=noopener}.

```metorex
class Tag
  def ==(other)
    other.kind_of? Tag
  end
end

class NeverEqual
  def ==(other)
    false
  end

  def equal?(other)
    false
  end
end

first = Tag.new
second = first.dup

puts(first == second)
puts(first === second)
puts(first === first)
puts(first === Object.new)

stubborn = NeverEqual.new
puts(stubborn == stubborn)
puts(stubborn === stubborn)
puts(stubborn === stubborn.dup)
```

Output:

```
true
true
true
false
false
true
false
```
