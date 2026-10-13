---
title: "advanced/block_param_inspect.rb"
slug: advanced-block-param-inspect
description: "The metorex example program advanced/block_param_inspect.rb and its output."
---

`tests/_examples/advanced/block_param_inspect.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/block_param_inspect.rb).

```metorex
# Inspect what blk is when no block is passed
def inspect_blk(&blk)
  puts blk.class
  puts blk.nil?.to_s
end
inspect_blk
```

Output:

```
NilClass
true
```
