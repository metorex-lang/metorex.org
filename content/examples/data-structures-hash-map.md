---
title: "data_structures/hash_map.rb"
slug: data-structures-hash-map
description: "The metorex example program data_structures/hash_map.rb and its output."
---

`tests/_examples/data_structures/hash_map.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/hash_map.rb){target=_blank rel=noopener}.

```metorex
prices = {apple: 2, pear: 3}

p prices.map { |name, price| "#{name}:#{price}" }
p prices.collect { |name, price| price * 2 }
p({}.map { |name, price| name })

begin
  prices.map
rescue RuntimeError => error
  puts error.message
end
```

Output:

```
["apple:2", "pear:3"]
[4, 6]
[]
map requires a block
```
