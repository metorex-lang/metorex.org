---
title: "site/beyond_parse.rb"
slug: site-beyond-parse
description: "The metorex example program site/beyond_parse.rb and its output."
---

`tests/_examples/site/beyond_parse.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/beyond_parse.rb).

```metorex
def grouped(node)
  case node["type"]
  when "BinaryOp" then "(#{grouped(node["left"])} #{node["op"]} #{grouped(node["right"])})"
  when "Grouped" then grouped(node["expression"])
  when "IntLiteral" then node["value"].to_s
  when "Identifier" then node["name"]
  end
end

puts grouped(parse("rate * hours + 40").first)
puts grouped(parse("rate * (hours + 40)").first)
```

Output:

```
((rate * hours) + 40)
(rate * (hours + 40))
```
