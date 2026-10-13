---
title: "oop/module/include_in_module.rb"
slug: oop-module-include-in-module
description: "The metorex example program oop/module/include_in_module.rb and its output."
---

`tests/_examples/oop/module/include_in_module.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module/include_in_module.rb).

```metorex
module Greetable
  def greet
    "hello"
  end
end

class Person
  include Greetable
end

puts Person.new.greet
```

Output:

```
hello
```
