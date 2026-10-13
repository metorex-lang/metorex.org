---
title: Syntax tree nodes
slug: syntax-tree-nodes
description: Every node type parse and Method#body answer, with the keys each one has.
order: 2
---

`parse(source)` answers an Array of nodes, one for each top-level statement in `source`, and `body` on the method `get_source` returns answers the method's statements the same way. A node is a Hash with a `"type"` key and the keys its type lists below. A child node is a Hash of the same kind, and a list of children is an Array. [Code as objects](/meta) shows them in use.

```metorex
node = parse("total = items.sum(:price) if ready").first
p node["type"]
p node["condition"]

assignment = node["then_branch"].first
p assignment["target"]["name"]
p assignment["value"]["method"]
p assignment["value"]["arguments"]
p node["else_branch"]

p parse("case size when 1 then :one end").first
```

```
"If"
{"type" => "Identifier", "name" => "ready"}
"total"
"sum"
[{"type" => "Symbol", "value" => "price"}]
nil
{"type" => "Unknown"}
```

A statement or expression with no type below answers `{"type" => "Unknown"}`, as the `case` above does. Method definitions are among them.

## Values

| Type | Keys |
| :-- | :-- |
| `IntLiteral` | `value`, an Integer |
| `FloatLiteral` | `value`, a Float |
| `StringLiteral` | `value`, a String. A string whose interpolations are all literals is folded into one `StringLiteral`. |
| `InterpolatedString` | none |
| `BoolLiteral` | `value`, true or false |
| `NilLiteral` | none |
| `Symbol` | `value`, the name as a String |
| `Array` | `elements`, an Array of nodes |
| `Dictionary` | `entries`, an Array of Hashes with `key` and `value` nodes |
| `Lambda` | `parameters`, an Array of names, and `body`, an Array of nodes |

## Names

| Type | Keys |
| :-- | :-- |
| `Identifier` | `name` |
| `InstanceVariable` | `name` |
| `ClassVariable` | `name` |
| `GlobalVariable` | `name` |
| `Self` | none |
| `ScopeResolution` | `namespace`, a node, and `name`, as in `Foo::Bar` |

## Operations and calls

| Type | Keys |
| :-- | :-- |
| `BinaryOp` | `op`, `left`, and `right` |
| `UnaryOp` | `op`, which is `-` or `!`, and `operand` |
| `Grouped` | `expression`, the node inside the parentheses |
| `Call` | `callee`, a node, and `arguments`, an Array of nodes, for a call with no receiver |
| `MethodCall` | `receiver`, a node, `method`, a String, and `arguments`, an Array of nodes |
| `Index` | `array` and `index`, as in `list[0]` |

`op` in a `BinaryOp` is one of `+`, `-`, `*`, `/`, `%`, `**`, `==`, `===`, `!=`, `<`, `>`, `<=`, `>=`, `<=>`, `&`, `|`, `^`, `&&`, `||`, `=`, `+=`, `-=`, `*=`, and `/=`.

## Statements

| Type | Keys |
| :-- | :-- |
| `Assignment` | `target` and `value`, both nodes. `@count += 1` is an `Assignment` too. |
| `If` | `condition`, `then_branch`, an Array of nodes, and `else_branch`, an Array of nodes or nil |
| `While` | `condition` and `body` |
| `For` | `variable`, a name, `iterable`, a node, and `body` |
| `Return` | `value`, a node or nil |
| `Raise` | `exception`, a node or nil |
| `Break` | none |
| `Continue` | none, for `next` |

The sample on this page is `tests/_examples/site/docs_nodes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, where the test suite checks its output.
