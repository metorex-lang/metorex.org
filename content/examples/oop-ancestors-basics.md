---
title: "oop/ancestors_basics.rb"
slug: oop-ancestors-basics
description: "The metorex example program oop/ancestors_basics.rb and its output."
---

`tests/_examples/oop/ancestors_basics.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/ancestors_basics.rb){target=_blank rel=noopener}.

```metorex
puts BasicObject.ancestors.inspect
puts Object.ancestors.inspect
puts Kernel.ancestors.inspect

module MSpecsAncestors
end
puts MSpecsAncestors.ancestors.inspect

class MSABasic
end
puts MSABasic.ancestors.inspect

class MSASuper < MSABasic
end
puts MSASuper.ancestors.inspect

class MSAParent
end
class MSAChild < MSAParent
end
puts MSAParent.ancestors.inspect
puts MSAChild.ancestors.inspect
```

Output:

```
[BasicObject]
[Object, Kernel, BasicObject]
[Kernel]
[MSpecsAncestors]
[MSABasic, Object, Kernel, BasicObject]
[MSASuper, MSABasic, Object, Kernel, BasicObject]
[MSAParent, Object, Kernel, BasicObject]
[MSAChild, MSAParent, Object, Kernel, BasicObject]
```
