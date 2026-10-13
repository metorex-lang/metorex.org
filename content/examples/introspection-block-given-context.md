---
title: "introspection/block_given_context.rb"
slug: introspection-block-given-context
description: "The metorex example program introspection/block_given_context.rb and its output."
---

`tests/_examples/introspection/block_given_context.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/block_given_context.rb){target=_blank rel=noopener}.

```metorex
module Reporter
  def self.direct
    block_given?
  end

  def self.with_named_block(&handler)
    block_given?
  end

  def self.inside_block
    yield_self { block_given? }
  end

  def self.via_kernel
    Kernel.block_given?
  end

  def self.via_send
    self.send :block_given?
  end

  class << self
    define_method(:from_define_method) do
      block_given?
    end
  end
end

puts Reporter.direct { }
puts Reporter.direct
puts Reporter.with_named_block { }
puts Reporter.with_named_block
puts Reporter.inside_block { }
puts Reporter.inside_block
puts Reporter.via_kernel { }
puts Reporter.via_kernel
puts Reporter.via_send { }
puts Reporter.via_send
puts Reporter.from_define_method { }
puts block_given?
```

Output:

```
true
false
true
false
true
false
true
false
true
false
false
false
```
