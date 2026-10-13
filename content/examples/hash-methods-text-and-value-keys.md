---
title: "hash_methods/text_and_value_keys.rb"
slug: hash-methods-text-and-value-keys
description: "The metorex example program hash_methods/text_and_value_keys.rb and its output."
---

`tests/_examples/hash_methods/text_and_value_keys.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/hash_methods/text_and_value_keys.rb).

```metorex
# A String key that reads as a number, a boolean or nil is a key of its own,
# apart from the value it reads as, since the two are not `eql?`.
mixed = {"646" => 1, 646 => 2, "true" => 3, true => 4, "nil" => 5, nil => 6, "1.5" => 7, 1.5 => 8}
p(mixed)
p(mixed.keys)
p([mixed["646"], mixed[646], mixed.key?("646"), mixed.key?("647")])
mixed.delete("646")
p(mixed.first)

built = {}
built["10"] = :text
built[10] = :number
p(built)
p({"1" => 2}.merge({1 => 3}))
p([["1", 1], [1, 2]].to_h)
p({"1" => 1}.transform_keys(&:to_i))
```

Output:

```
{"646" => 1, 646 => 2, "true" => 3, true => 4, "nil" => 5, nil => 6, "1.5" => 7, 1.5 => 8}
["646", 646, "true", true, "nil", nil, "1.5", 1.5]
[1, 2, true, false]
[646, 2]
{"10" => :text, 10 => :number}
{"1" => 2, 1 => 3}
{"1" => 1, 1 => 2}
{1 => 1}
```
