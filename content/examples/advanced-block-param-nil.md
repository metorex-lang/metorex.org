---
title: "advanced/block_param_nil.rb"
slug: advanced-block-param-nil
description: "The metorex example program advanced/block_param_nil.rb and its output."
---

`tests/_examples/advanced/block_param_nil.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/block_param_nil.rb){target=_blank rel=noopener}.

```metorex
# Test calling a method that accepts &blk without passing a block
def maybe_yield(&blk)
  if blk.nil?
    "no block"
  else
    blk.call(42)
  end
end
puts maybe_yield()
puts maybe_yield() { |x| x * 2 }
```

Output:

```
no block
84
```
