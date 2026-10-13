---
title: "instance_exec/block_pass_test.rb"
slug: instance-exec-block-pass-test
description: "The metorex example program instance_exec/block_pass_test.rb and its output."
---

`tests/_examples/instance_exec/block_pass_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/instance_exec/block_pass_test.rb){target=_blank rel=noopener}.

```metorex
module MSpecMatchers
  private def equal(expected)
    "EqualMatcher:#{expected}"
  end
end

class MSpecEnv
  include MSpecMatchers
end

ENV_OBJ = MSpecEnv.new

def store_block(&block)
  block
end

def protect_it(&block)
  ENV_OBJ.instance_exec(&block)
end

$result = nil
blk = store_block { $result = equal(42) }
protect_it(&blk)
puts $result
```
