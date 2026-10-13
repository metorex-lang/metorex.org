---
title: "methods/yield_qmark_call.rb"
slug: methods-yield-qmark-call
description: "The metorex example program methods/yield_qmark_call.rb and its output."
---

`tests/_examples/methods/yield_qmark_call.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/yield_qmark_call.rb).

```metorex
class Foo
  def yield?(invert = false)
    !invert
  end

  def check
    yield?(false)
  end
end

puts Foo.new.check
```

Output:

```
true
```
