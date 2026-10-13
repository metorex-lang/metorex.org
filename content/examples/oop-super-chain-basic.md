---
title: "oop/super/chain_basic.rb"
slug: oop-super-chain-basic
description: "The metorex example program oop/super/chain_basic.rb and its output."
---

`tests/_examples/oop/super/chain_basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/super/chain_basic.rb){target=_blank rel=noopener}.

```metorex
class GrandParent
  def initialize
    @level = "GrandParent"
  end

  def get_level
    @level
  end
end

class Parent < GrandParent
  def initialize
    super()
    @parent_level = "Parent"
  end

  def get_parent_level
    @parent_level
  end
end

class Child < Parent
  def initialize
    super()
    @child_level = "Child"
  end

  def get_child_level
    @child_level
  end
end

child = Child.new
puts child.get_level
puts child.get_parent_level
puts child.get_child_level
```

Output:

```
GrandParent
Parent
Child
```
