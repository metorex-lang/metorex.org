---
title: "advanced/block_as_arg.rb"
slug: advanced-block-as-arg
description: "The metorex example program advanced/block_as_arg.rb and its output."
---

`tests/_examples/advanced/block_as_arg.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/block_as_arg.rb).

```metorex
# Test passing a block as an argument using & syntax
def apply(&blk)
  blk.call(5)
end

b = lambda { |x| x * 3 }
puts apply(&b)
```

Output:

```
15
```
