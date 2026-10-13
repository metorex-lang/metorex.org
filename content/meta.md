---
title: Code as objects
slug: meta
description: Metorex returns a method's body or a block's statements to your program as syntax tree nodes, and parses source strings into the same nodes.
layout: page
---

The **Met**a **O**bject **R**untime **Ex**ecution in the name means a program can read its own code. Metorex returns a method's body, a block's statements, or a parsed string to the program as syntax tree nodes. Each node is a hash with a `"type"` key and the fields for that type.

## A method's body

`get_source` returns the method. `body` returns its statements as nodes.

<div class="code-and-diagram">
<pre><code class="language-metorex">class Invoice
  def total(price, quantity)
    price * quantity + 5
  end
end</code></pre>
<figure class="tree-diagram">
<svg viewBox="0 0 440 270" role="img" aria-labelledby="invoice-tree-title">
<title id="invoice-tree-title">The syntax tree of price * quantity + 5</title>
<g class="tree-edges">
<line x1="220" y1="62" x2="130" y2="118"/>
<line x1="220" y1="62" x2="340" y2="118"/>
<line x1="130" y1="162" x2="70" y2="208"/>
<line x1="130" y1="162" x2="200" y2="208"/>
</g>
<g class="tree-node tree-operator"><rect x="155" y="18" width="130" height="44" rx="8"/><text x="220" y="36" class="tree-type">BinaryOp</text><text x="220" y="54" class="tree-detail">+</text></g>
<g class="tree-node tree-operator"><rect x="65" y="118" width="130" height="44" rx="8"/><text x="130" y="136" class="tree-type">BinaryOp</text><text x="130" y="154" class="tree-detail">*</text></g>
<g class="tree-node"><rect x="275" y="118" width="130" height="44" rx="8"/><text x="340" y="136" class="tree-type">IntLiteral</text><text x="340" y="154" class="tree-detail">5</text></g>
<g class="tree-node"><rect x="5" y="208" width="130" height="44" rx="8"/><text x="70" y="226" class="tree-type">Identifier</text><text x="70" y="244" class="tree-detail">price</text></g>
<g class="tree-node"><rect x="140" y="208" width="130" height="44" rx="8"/><text x="205" y="226" class="tree-type">Identifier</text><text x="205" y="244" class="tree-detail">quantity</text></g>
</svg>
<figcaption>The tree <code>Invoice#total</code>'s body returns. <code>*</code> sits below <code>+</code> because it binds tighter.</figcaption>
</figure>
</div>

A program can walk those nodes like any other hashes:

```metorex
method = Invoice.new.get_source(:total)
puts "#{method.name} takes #{method.arity} arguments"

def show(node, depth = 0)
  detail = case node["type"]
           when "BinaryOp" then node["op"]
           when "Identifier" then node["name"]
           when "IntLiteral" then node["value"]
           end
  puts "#{"  " * depth}#{node["type"]} #{detail}"
  show(node["left"], depth + 1) if node["left"]
  show(node["right"], depth + 1) if node["right"]
end

show(method.body.first)
```

```
total takes 2 arguments
BinaryOp +
  BinaryOp *
    Identifier price
    Identifier quantity
  IntLiteral 5
```

## A block's statements

A block captured with `&block` answers `statements` the same way, and it still runs:

```metorex
def capture(&block) = block

rule = capture { |order| order * 2 }
p rule.arity
p rule.statements.first
p rule.call(21)
```

```
1
{"type" => "BinaryOp", "op" => "*", "left" => {"type" => "Identifier", "name" => "order"}, "right" => {"type" => "IntLiteral", "value" => 2}}
42
```

## Parsing a string

`parse` turns source text into the same nodes without running it:

```metorex
tree = parse("1 + 2 * 3")
p tree.first["op"]
p tree.first["right"]
```

```
"+"
{"type" => "BinaryOp", "op" => "*", "left" => {"type" => "IntLiteral", "value" => 2}, "right" => {"type" => "IntLiteral", "value" => 3}}
```

The samples on this page are `tests/_examples/site/meta.rb`, `meta_block.rb`, and `meta_parse.rb` in the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, where the test suite checks their output.
