---
title: "metaprogramming/const_added_hook.rb"
slug: metaprogramming-const-added-hook
description: "The metorex example program metaprogramming/const_added_hook.rb and its output."
---

`tests/_examples/metaprogramming/const_added_hook.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/const_added_hook.rb).

```metorex
class Tracker
  ADDED = []

  def self.const_added(name)
    ADDED << name
    puts ADDED.inspect
  end

  TEST = 1
  SECOND = 2

  autoload :Autoload, "tracker/autoload.rb"

  class Child
  end
end

Tracker.const_set :DIRECT, 4
```

Output:

```
[:TEST]
[:TEST, :SECOND]
[:TEST, :SECOND, :Autoload]
[:TEST, :SECOND, :Autoload, :Child]
[:TEST, :SECOND, :Autoload, :Child, :DIRECT]
```
