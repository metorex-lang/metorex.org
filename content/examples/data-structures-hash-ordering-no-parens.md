---
title: "data_structures/hash_ordering_no_parens.rb"
slug: data-structures-hash-ordering-no-parens
description: "The metorex example program data_structures/hash_ordering_no_parens.rb and its output."
---

`tests/_examples/data_structures/hash_ordering_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/hash_ordering_no_parens.rb){target=_blank rel=noopener}.

```metorex
recipe = { "name" => "stew", "servings" => 4, "vegetarian" => false }
puts recipe.keys.inspect
puts recipe.values.inspect

recipe["rating"] = 5
puts recipe.keys.inspect

recipe["name"] = "soup"
puts recipe.keys.inspect

recipe.delete "servings"
puts recipe.keys.inspect

collected = []
recipe.each do |key, value|
  collected << key
end
puts collected.inspect

pairs = [1, 2, first: "a", second: "b"]
puts pairs.length
puts pairs.last.keys.inspect

arrow_pairs = ["x" => 1, "y" => 2]
puts arrow_pairs.length
puts arrow_pairs.first.keys.inspect

only_keywords = [alpha: 1, beta: 2]
puts only_keywords.first.keys.inspect
```

Output:

```
["name", "servings", "vegetarian"]
["stew", 4, false]
["name", "servings", "vegetarian", "rating"]
["name", "servings", "vegetarian", "rating"]
["name", "vegetarian", "rating"]
["name", "vegetarian", "rating"]
3
[:first, :second]
1
["x", "y"]
[:alpha, :beta]
```
