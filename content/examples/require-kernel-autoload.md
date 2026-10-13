---
title: "require/kernel_autoload.rb"
slug: require-kernel-autoload
description: "The metorex example program require/kernel_autoload.rb and its output."
---

`tests/_examples/require/kernel_autoload.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/kernel_autoload.rb).

```metorex
target = File.expand_path "autoload_lib/kernel_autoload_target.rb", __dir__

autoload :AutoloadTarget, target

puts autoload?(:AutoloadTarget) == target
puts Object.autoload?(:AutoloadTarget) == target
puts autoload?(:NeverRegistered).inspect

def registered(name)
  autoload? name
end

puts registered(:AutoloadTarget) == target

puts AutoloadTarget.loaded
puts autoload?(:AutoloadTarget).inspect
puts Kernel.private_instance_methods.include? :autoload
puts Kernel.private_instance_methods.include? :autoload?
```

Output:

```
true
true
nil
true
from_autoload
nil
true
true
```
