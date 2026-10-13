---
title: "callables/forwarded_block_scope_no_parens.rb"
slug: callables-forwarded-block-scope-no-parens
description: "The metorex example program callables/forwarded_block_scope_no_parens.rb and its output."
---

`tests/_examples/callables/forwarded_block_scope_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/forwarded_block_scope_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Walker
  def each_item &block
    [1, 2].each(&block)
  end

  def each_pair_of &block
    { a: 1 }.each_pair(&block)
  end
end

module Shipping
  RATE = 4

  class Entry
    def initialize value
      @value = value
    end

    def to_s = "entry #{@value}"
  end

  def self.collect
    found = []
    Walker.new.each_item { |item| found << Entry.new(item * RATE).to_s }
    Walker.new.each_pair_of { |key, value| found << "#{key} #{value + RATE}" }
    found
  end
end

p Shipping.collect
```

Output:

```
["entry 4", "entry 8", "a 5"]
```
