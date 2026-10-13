---
title: "oop/autoload_during_target.rb"
slug: oop-autoload-during-target
description: "The metorex example program oop/autoload_during_target.rb and its output."
---

`tests/_examples/oop/autoload_during_target.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_during_target.rb){target=_blank rel=noopener}.

```metorex
module Outer
  class DuringAutoloadAfterDefine
    puts "Outer.constants: #{Outer.constants.inspect}"
    puts "Outer.const_defined?(:DuringAutoloadAfterDefine): #{Outer.const_defined?(:DuringAutoloadAfterDefine, false)}"
    $during_value = $check.call
  end
end
```
