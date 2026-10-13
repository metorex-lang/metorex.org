---
title: "oop/test/super_simple.rb"
slug: oop-test-super-simple
description: "The metorex example program oop/test/super_simple.rb and its output."
---

`tests/_examples/oop/test/super_simple.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/test/super_simple.rb){target=_blank rel=noopener}.

```metorex
class A
  def foo
    "A"
  end
end

class B < A
  def foo
    super + "B"
  end
end

b = B.new
puts b.foo
```

Output:

```
AB
```
