---
title: "site/meta_block.rb"
slug: site-meta-block
description: "The metorex example program site/meta_block.rb and its output."
---

`tests/_examples/site/meta_block.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/meta_block.rb){target=_blank rel=noopener}.

```metorex
def capture(&block) = block

rule = capture { |order| order * 2 }
p rule.arity
p rule.statements.first
p rule.call(21)
```

Output:

```
1
{"type" => "BinaryOp", "op" => "*", "left" => {"type" => "Identifier", "name" => "order"}, "right" => {"type" => "IntLiteral", "value" => 2}}
42
```
