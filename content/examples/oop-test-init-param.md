---
title: "oop/test/init_param.rb"
slug: oop-test-init-param
description: "The metorex example program oop/test/init_param.rb and its output."
---

`tests/_examples/oop/test/init_param.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/test/init_param.rb).

```metorex
class Test
  def initialize(x)
    @x = x
  end

  attr_reader :x
end

t = Test.new(42)
puts t.x
```
