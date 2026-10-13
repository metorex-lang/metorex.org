---
title: "advanced/traits.rb"
slug: advanced-traits
description: "The metorex example program advanced/traits.rb and its output."
---

`tests/_examples/advanced/traits.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/traits.rb).

```metorex
module Drawable
  def draw
  end
end

class Circle
  include Drawable

  def draw
    puts "Drawing circle"
  end
end
```

Output:

The program prints nothing.
