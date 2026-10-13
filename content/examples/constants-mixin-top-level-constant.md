---
title: "constants/mixin_top_level_constant.rb"
slug: constants-mixin-top-level-constant
description: "The metorex example program constants/mixin_top_level_constant.rb and its output."
---

`tests/_examples/constants/mixin_top_level_constant.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/constants/mixin_top_level_constant.rb){target=_blank rel=noopener}.

```metorex
module Helpers
  def helped = :top_level
end

module Outer
  module Helpers
    def helped = :nested
  end

  class Widget
    include ::Helpers
  end

  class Gadget
    extend ::Helpers
  end
end

p [Outer::Widget.new.helped, Outer::Gadget.helped]
```

Output:

```
[:top_level, :top_level]
```
