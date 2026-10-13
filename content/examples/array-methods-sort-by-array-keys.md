---
title: "array_methods/sort_by_array_keys.rb"
slug: array-methods-sort-by-array-keys
description: "The metorex example program array_methods/sort_by_array_keys.rb and its output."
---

`tests/_examples/array_methods/sort_by_array_keys.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/sort_by_array_keys.rb).

```metorex
positions = [[2, 10], [1, 12], [1, 3], [2, 1]]
p(positions.sort_by { |line, column| [line, column] })
p(positions.min_by { |position| position })
p(positions.max_by { |position| position })

Token = Struct.new(:pos, :text)
tokens = [Token.new([1, 12], "end"), Token.new([1, 3], "def"), Token.new([1, 0], "x")]
p(tokens.sort_by(&:pos).map(&:text))

held = positions.dup
held.sort_by! { |position| position }
p(held)

begin
  [[1], ["a"]].sort_by { |key| key }
rescue ArgumentError => e
  p(e.message)
end
```

Output:

```
[[1, 3], [1, 12], [2, 1], [2, 10]]
[1, 3]
[2, 10]
["x", "def", "end"]
[[1, 3], [1, 12], [2, 1], [2, 10]]
"comparison of Array with Array failed"
```
