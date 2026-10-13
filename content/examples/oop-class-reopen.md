---
title: "oop/class/reopen.rb"
slug: oop-class-reopen
description: "The metorex example program oop/class/reopen.rb and its output."
---

`tests/_examples/oop/class/reopen.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/class/reopen.rb){target=_blank rel=noopener}.

```metorex
class Foo
  def bar
    "bar"
  end
end

class Foo
  def baz
    "baz"
  end
end

f = Foo.new
puts f.bar
puts f.baz
```

Output:

```
bar
baz
```
