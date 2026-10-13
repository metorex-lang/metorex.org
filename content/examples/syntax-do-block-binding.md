---
title: "syntax/do_block_binding.rb"
slug: syntax-do-block-binding
description: "The metorex example program syntax/do_block_binding.rb and its output."
---

`tests/_examples/syntax/do_block_binding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/do_block_binding.rb).

```metorex
# A `do ... end` block belongs to the outermost command, where a `{ }` block
# belongs to the call it sits next to.
class Outer
  def takes(first, second)
    held = yield
    "outer got #{held}"
  end
end

class Inner
  def permitted?
    "permitted"
  end

  def takes_a_block(name)
    block_given? ? "inner took it" : "inner had none"
  end
end

outer = Outer.new
inner = Inner.new
p(outer.takes "a", inner.permitted? do
  "the block"
end)
p(outer.takes("a", inner.takes_a_block("x") { "brace" }) { "the block" })
```

Output:

```
"outer got the block"
"outer got the block"
```
