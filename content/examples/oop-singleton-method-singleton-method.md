---
title: "oop/singleton_method/singleton_method.rb"
slug: oop-singleton-method-singleton-method
description: "The metorex example program oop/singleton_method/singleton_method.rb and its output."
---

`tests/_examples/oop/singleton_method/singleton_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/singleton_method/singleton_method.rb).

```metorex
obj = Object.new
def obj.greet
  "hello from singleton"
end
puts obj.greet
```

Output:

```
hello from singleton
```
