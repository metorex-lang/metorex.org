---
title: "oop/autoload_shadows_a_top_level_constant.rb"
slug: oop-autoload-shadows-a-top-level-constant
description: "The metorex example program oop/autoload_shadows_a_top_level_constant.rb and its output."
---

`tests/_examples/oop/autoload_shadows_a_top_level_constant.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_shadows_a_top_level_constant.rb){target=_blank rel=noopener}.

```metorex
$LOAD_PATH.unshift(File.join(__dir__, "autoload_fixture"))

class Table
  def self.source = :top_level
end

module Shipping
  autoload :Table, "shipping_rates_table"

  class Quote
    def source = Table.source
  end
end

p(Shipping::Quote.new.source)
p(Table.source)
```

Output:

```
:autoloaded
:top_level
```
