---
title: "oop/autoload_multi.rb"
slug: oop-autoload-multi
description: "The metorex example program oop/autoload_multi.rb and its output."
---

`tests/_examples/oop/autoload_multi.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_multi.rb){target=_blank rel=noopener}.

```metorex
module ModuleSpecs
  module Autoload
  end
end

module ModuleSpecs::Autoload
  L = :autoload_l
  M = :autoload_m
end

puts ModuleSpecs::Autoload::L
puts ModuleSpecs::Autoload::M
```
