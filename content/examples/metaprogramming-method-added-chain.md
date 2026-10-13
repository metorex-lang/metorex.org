---
title: "metaprogramming/method_added_chain.rb"
slug: metaprogramming-method-added-chain
description: "The metorex example program metaprogramming/method_added_chain.rb and its output."
---

`tests/_examples/metaprogramming/method_added_chain.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/method_added_chain.rb).

```metorex
module Tracking
  def method_added(name)
    super(name)
    (@seen ||= []) << name
  end

  def singleton_method_added(name)
    super(name)
    (@singletons ||= []) << name
  end
end

module Counting
  def method_added(name)
    super
    @count = (@count || 0) + 1
  end
end

class Rates
  extend(Tracking)
  extend(Counting)

  class << self
    def method_added(name)
      super
      @last = name
    end

    attr_reader(:seen, :count, :last, :singletons)
  end

  attr_writer :region
  attr_accessor :currency
  def load_rates = 1
  def store_rates = 2
  def self.refresh = 3
end

p([Rates.seen, Rates.count, Rates.last])
p(Rates.singletons)
```

Output:

```
[[:region=, :currency, :currency=, :load_rates, :store_rates], 5, :store_rates]
[:method_added, :seen, :count, :last, :singletons, :refresh]
```
