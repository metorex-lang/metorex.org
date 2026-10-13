---
title: "require/autoload_in_a_module_parens.rb"
slug: require-autoload-in-a-module-parens
description: "The metorex example program require/autoload_in_a_module_parens.rb and its output."
---

`tests/_examples/require/autoload_in_a_module_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/autoload_in_a_module_parens.rb){target=_blank rel=noopener}.

```metorex
# `autoload` inside a module's method registers on that module, since that is
# the scope the call sits in. `Kernel.autoload` registers in the same place.
target = File.expand_path("autoload_lib/module_autoload_target.rb", __dir__)

module Holder
  def register(file)
    autoload(:FromModuleMethod, file)
  end

  def register_through_kernel(file)
    Kernel.autoload(:AlsoFromModuleMethod, file)
  end
end

class Uses
  include Holder
end

Uses.new.register(target)
puts(Holder.autoload?(:FromModuleMethod) == target)
puts(Uses.autoload?(:FromModuleMethod) == target)
puts(Object.autoload?(:FromModuleMethod).inspect)

Uses.new.register_through_kernel(target)
puts(Holder.autoload?(:AlsoFromModuleMethod) == target)
puts(Object.autoload?(:AlsoFromModuleMethod).inspect)

puts(Holder::FromModuleMethod.loaded)
```

Output:

```
true
true
nil
true
nil
from_a_module_method
```
