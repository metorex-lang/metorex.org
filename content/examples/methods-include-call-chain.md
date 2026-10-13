---
title: "methods/include_call_chain.rb"
slug: methods-include-call-chain
description: "The metorex example program methods/include_call_chain.rb and its output."
---

`tests/_examples/methods/include_call_chain.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/include_call_chain.rb).

```metorex
class Builder
  def include(item)
    [:included, item]
  end

  def run
    first = include(1).first
    from_brace_block = proc { include(2).last }.call
    from_lambda = lambda { include(3).size }.call
    [first, from_brace_block, from_lambda]
  end
end

p Builder.new.run
```

Output:

```
[:included, 2, 2]
```
