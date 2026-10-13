---
title: "oop/class/class.rb"
slug: oop-class-class
description: "The metorex example program oop/class/class.rb and its output."
---

`tests/_examples/oop/class/class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/class/class.rb){target=_blank rel=noopener}.

```metorex
class Greeter
  def initialize(name)
    @name = name
  end

  def greeting
    "Hello, " + @name + "!"
  end
end

greeter = Greeter.new("Ada")
message = greeter.greeting
puts message
```
