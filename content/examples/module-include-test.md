---
title: "module_include_test.rb"
slug: module-include-test
description: "The metorex example program module_include_test.rb and its output."
---

`tests/_examples/module_include_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/module_include_test.rb).

```metorex
module MSpecMatchers
  private def equal(expected)
    "matcher:#{expected}"
  end
end

class MSpecEnv
  include MSpecMatchers
end

env = MSpecEnv.new
result = env.equal("hello")
puts result
```
