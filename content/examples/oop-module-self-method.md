---
title: "oop/module/self_method.rb"
slug: oop-module-self-method
description: "The metorex example program oop/module/self_method.rb and its output."
---

`tests/_examples/oop/module/self_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module/self_method.rb){target=_blank rel=noopener}.

```metorex
module MyModule
  def self.class_method
    "from module"
  end
end

def MyModule.another_method
  "also from module"
end

puts MyModule.class_method
puts MyModule.another_method
```

Output:

```
from module
also from module
```
