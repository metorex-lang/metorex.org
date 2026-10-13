---
title: "stdlib/json_documents.rb"
slug: stdlib-json-documents
description: "The metorex example program stdlib/json_documents.rb and its output."
---

`tests/_examples/stdlib/json_documents.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/json_documents.rb){target=_blank rel=noopener}.

```metorex
require "json"

held = JSON.parse('{"name": "Ada", "years": [1815, 1852], "note": null, "rate": 2.5}')
puts held["name"]
puts held["years"].inspect
puts held["note"].inspect
puts held["rate"]

puts JSON.parse('{"a": 1}', symbolize_names: true).inspect
puts JSON.generate({ "a" => 1, "b" => [true, false, nil] })
puts JSON.pretty_generate({ "a" => 1, "b" => [1, 2] })
puts({ "k" => "v" }.to_json)
puts [1, "two", nil].to_json

puts JSON.parse('"a\nbA"').inspect
puts JSON.parse("[]").inspect
puts JSON.parse("{}").inspect

begin
  JSON.parse("{")
rescue JSON::ParserError => refused
  puts "refused: #{refused.class}"
end

# A number too long to walk digit by digit is read in one step.
puts JSON.parse("[1.#{'1' * 100000}]").first
```

Output:

```
Ada
[1815, 1852]
nil
2.5
{a: 1}
{"a":1,"b":[true,false,null]}
{
  "a": 1,
  "b": [
    1,
    2
  ]
}
{"k":"v"}
[1,"two",null]
"a\nbA"
[]
{}
refused: JSON::ParserError
1.1111111111111112
```
