---
title: "site/docs_nodes.rb"
slug: site-docs-nodes
description: "The metorex example program site/docs_nodes.rb and its output."
---

`tests/_examples/site/docs_nodes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/docs_nodes.rb){target=_blank rel=noopener}.

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

Output:

```
"If"
{"type" => "Identifier", "name" => "ready"}
"total"
"sum"
[{"type" => "Symbol", "value" => "price"}]
nil
{"type" => "Unknown"}
```
