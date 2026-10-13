---
title: "oop/include_nested_modules.rb"
slug: oop-include-nested-modules
description: "The metorex example program oop/include_nested_modules.rb and its output."
---

`tests/_examples/oop/include_nested_modules.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/include_nested_modules.rb){target=_blank rel=noopener}.

```metorex
module Leaf
  LABEL = 'leaf'

  def leaf_name
    :leaf
  end
end

module Branch
end

module Trunk
  LABEL = 'trunk'

  def self.label
    LABEL
  end
end

class Tree
  include Branch
end

class Sapling
  include Leaf
end

class Seedling < Sapling
  include Leaf
end

puts Trunk.label.inspect
Trunk.include Leaf
puts Trunk.label.inspect

Branch.include Leaf
puts Tree.new.leaf_name.inspect
puts (Tree.instance_methods - Object.instance_methods).inspect
puts Seedling.ancestors[0, 3].inspect
```

Output:

```
"trunk"
"trunk"
:leaf
[:leaf_name]
[Seedling, Sapling, Leaf]
```
