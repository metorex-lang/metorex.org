---
title: "instance_exec/method_test.rb"
slug: instance-exec-method-test
description: "The metorex example program instance_exec/method_test.rb and its output."
---

`tests/_examples/instance_exec/method_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/instance_exec/method_test.rb){target=_blank rel=noopener}.

```metorex
module MSpecMatchers
  private def equal(expected)
    "EqualMatcher:#{expected}"
  end
end

class MSpecEnv
  include MSpecMatchers
end

env = MSpecEnv.new

result = nil
env.instance_exec do
  result = equal(42)
end

puts result
```
