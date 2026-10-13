---
title: "oop/ancestors_parent_class.rb"
slug: oop-ancestors-parent-class
description: "The metorex example program oop/ancestors_parent_class.rb and its output."
---

`tests/_examples/oop/ancestors_parent_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/ancestors_parent_class.rb).

```metorex
class AParent
end

puts AParent.ancestors.inspect
puts [AParent, Object, Kernel, BasicObject].inspect
puts AParent.ancestors == [AParent, Object, Kernel, BasicObject]
puts "---"
puts AParent.ancestors.first == AParent
puts AParent.ancestors[1] == Object
puts AParent.ancestors[2] == Kernel
puts AParent.ancestors[3] == BasicObject
```

Output:

```
[AParent, Object, Kernel, BasicObject]
[AParent, Object, Kernel, BasicObject]
true
---
true
true
true
true
```
