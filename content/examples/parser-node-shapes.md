---
title: "parser/node_shapes.rb"
slug: parser-node-shapes
description: "The metorex example program parser/node_shapes.rb and its output."
---

`tests/_examples/parser/node_shapes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/parser/node_shapes.rb).

```metorex
# The node `parse` answers for each kind of statement and expression.
p parse('"a#{x}"').first
p parse("def f(a, b)\n  a\nend").first
p parse("while x\n  y\nend").first
p parse("for i in list\n  i\nend").first
p parse("raise Error").first
p parse("while x\n  next\n  break\nend").first["body"]
p parse("list[0]").first
p parse("-x").first
p parse("!x").first
```

Output:

```
{"type" => "InterpolatedString"}
{"type" => "Unknown"}
{"type" => "While", "condition" => {"type" => "Identifier", "name" => "x"}, "body" => [{"type" => "Identifier", "name" => "y"}]}
{"type" => "For", "variable" => "i", "iterable" => {"type" => "Identifier", "name" => "list"}, "body" => [{"type" => "Identifier", "name" => "i"}]}
{"type" => "Raise", "exception" => {"type" => "Identifier", "name" => "Error"}}
[{"type" => "Continue"}, {"type" => "Break"}]
{"type" => "Index", "array" => {"type" => "Identifier", "name" => "list"}, "index" => {"type" => "IntLiteral", "value" => 0}}
{"type" => "UnaryOp", "op" => "-", "operand" => {"type" => "Identifier", "name" => "x"}}
{"type" => "UnaryOp", "op" => "!", "operand" => {"type" => "Identifier", "name" => "x"}}
```
