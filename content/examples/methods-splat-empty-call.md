---
title: "methods/splat_empty_call.rb"
slug: methods-splat-empty-call
description: "The metorex example program methods/splat_empty_call.rb and its output."
---

`tests/_examples/methods/splat_empty_call.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/splat_empty_call.rb){target=_blank rel=noopener}.

```metorex
class Target
  def ping
    "pong"
  end
end

class Forwarder
  def initialize(actual)
    @actual = actual
  end

  def method_missing(name, *args, &block)
    @actual.__send__(name, *args, &block)
  end
end

t = Target.new
f = Forwarder.new(t)
puts f.ping
```

Output:

```
pong
```
