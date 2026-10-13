---
title: "oop/included_hook_parens.rb"
slug: oop-included-hook-parens
description: "The metorex example program oop/included_hook_parens.rb and its output."
---

`tests/_examples/oop/included_hook_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/included_hook_parens.rb).

```metorex
$order = []

module Tracker
  def self.included(base)
    $order << [:included, base.name]
  end
end

module SelfExtender
  def self.included(base)
    base.extend(self)
  end

  def helper
    :helped
  end
end

module Chained
  class << Chained
    def included(base)
      $order << :chained
      super
    end
  end
end

class Host
  include(Tracker)
end

class Helped
  include(SelfExtender)
end

class Linked
  include(Chained)
end

puts($order.inspect)
puts(Helped.helper.inspect)
puts(Module.new.private_methods.include?(:included).inspect)
```

Output:

```
[[:included, "Host"], :chained]
:helped
true
```
