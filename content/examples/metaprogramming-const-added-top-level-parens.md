---
title: "metaprogramming/const_added_top_level_parens.rb"
slug: metaprogramming-const-added-top-level-parens
description: "The metorex example program metaprogramming/const_added_top_level_parens.rb and its output."
---

`tests/_examples/metaprogramming/const_added_top_level_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/const_added_top_level_parens.rb){target=_blank rel=noopener}.

```metorex
class Module
  def const_added(name)
    puts("added #{name} to #{self.name || self.inspect}")
  end
end

module TopLevelModule
end

class TopLevelClass
end

TopLevelConstant = 1

module Outer
  Inner = 2

  module Nested
  end
end

AnonymousBound = Module.new
puts(AnonymousBound.name)
```

Output:

```
added TopLevelModule to Object
added TopLevelClass to Object
added TopLevelConstant to Object
added Outer to Object
added Inner to Outer
added Nested to Outer
added AnonymousBound to Object
AnonymousBound
```
