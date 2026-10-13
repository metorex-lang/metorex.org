---
title: "site/meta_parse.rb"
slug: site-meta-parse
description: "The metorex example program site/meta_parse.rb and its output."
---

`tests/_examples/site/meta_parse.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/meta_parse.rb){target=_blank rel=noopener}.

```metorex
tree = parse("1 + 2 * 3")
p tree.first["op"]
p tree.first["right"]
```

Output:

```
"+"
{"type" => "BinaryOp", "op" => "*", "left" => {"type" => "IntLiteral", "value" => 2}, "right" => {"type" => "IntLiteral", "value" => 3}}
```
