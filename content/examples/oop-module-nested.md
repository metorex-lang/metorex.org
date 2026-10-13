---
title: "oop/module/nested.rb"
slug: oop-module-nested
description: "The metorex example program oop/module/nested.rb and its output."
---

`tests/_examples/oop/module/nested.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module/nested.rb).

```metorex
module Outer
  module Inner
    def self.greet
      "hello from Inner"
    end
  end

  class Widget
    def name
      "widget"
    end
  end
end

puts Outer::Inner.greet
puts Outer::Widget.new.name
```

Output:

```
hello from Inner
widget
```
