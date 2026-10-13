---
title: "oop/autoload_during_test.rb"
slug: oop-autoload-during-test
description: "The metorex example program oop/autoload_during_test.rb and its output."
---

`tests/_examples/oop/autoload_during_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_during_test.rb){target=_blank rel=noopener}.

```metorex
module Outer
end

$during_value = nil
$check = -> { defined?(Outer::DuringAutoloadAfterDefine) }

target_path = File.expand_path("autoload_during_target.rb", __dir__)
Outer.autoload :DuringAutoloadAfterDefine, target_path

before = $check.call
puts "before: #{before.inspect}"

Outer.const_get(:DuringAutoloadAfterDefine)
puts "during (after const assigned in fixture): #{$during_value.inspect}"

after = $check.call
puts "after: #{after.inspect}"
```
