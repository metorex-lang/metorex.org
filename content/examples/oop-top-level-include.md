---
title: "oop/top_level_include.rb"
slug: oop-top-level-include
description: "The metorex example program oop/top_level_include.rb and its output."
---

`tests/_examples/oop/top_level_include.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/top_level_include.rb){target=_blank rel=noopener}.

```metorex
module Greeter
  def hello
    "hi from greeter"
  end
end

include Greeter
puts Object.ancestors.include?(Greeter)
puts hello
```

Output:

```
true
hi from greeter
```
