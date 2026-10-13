---
title: "oop/ancestors_standalone_module_singleton.rb"
slug: oop-ancestors-standalone-module-singleton
description: "The metorex example program oop/ancestors_standalone_module_singleton.rb and its output."
---

`tests/_examples/oop/ancestors_standalone_module_singleton.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/ancestors_standalone_module_singleton.rb).

```metorex
module ASMStandalone
end

puts ASMStandalone.singleton_class.ancestors.inspect
puts ASMStandalone.singleton_class.ancestors.include?(Module)
puts ASMStandalone.singleton_class.ancestors.include?(Object)
puts ASMStandalone.singleton_class.ancestors.include?(Kernel)
puts ASMStandalone.singleton_class.ancestors.include?(BasicObject)
```

Output:

```
[#<Class:ASMStandalone>, Module, Object, Kernel, BasicObject]
true
true
true
true
```
