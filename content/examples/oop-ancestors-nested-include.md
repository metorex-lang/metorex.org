---
title: "oop/ancestors_nested_include.rb"
slug: oop-ancestors-nested-include
description: "The metorex example program oop/ancestors_nested_include.rb and its output."
---

`tests/_examples/oop/ancestors_nested_include.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/ancestors_nested_include.rb){target=_blank rel=noopener}.

```metorex
module NIBasic
  def public_module; end
end

module NISuper
  include NIBasic
  def public_super_module; end
end

class NIParent
  def parent_method; end
end

class NIChild < NIParent
  include NISuper
end

puts NIBasic.ancestors.inspect
puts NISuper.ancestors.inspect
puts NIParent.ancestors.inspect
puts NIChild.ancestors.inspect
puts "---"
puts NIChild.ancestors == [NIChild, NISuper, NIBasic, NIParent, Object, Kernel, BasicObject]
```

Output:

```
[NIBasic]
[NISuper, NIBasic]
[NIParent, Object, Kernel, BasicObject]
[NIChild, NISuper, NIBasic, NIParent, Object, Kernel, BasicObject]
---
true
```
