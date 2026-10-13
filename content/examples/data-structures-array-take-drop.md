---
title: "data_structures/array_take_drop.rb"
slug: data-structures-array-take-drop
description: "The metorex example program data_structures/array_take_drop.rb and its output."
---

`tests/_examples/data_structures/array_take_drop.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/array_take_drop.rb).

```metorex
numbers = [1, 2, 3, 4]

p numbers.take 2
p numbers.drop 2
p numbers.take 0
p numbers.drop 9
p numbers.take 9

begin
  numbers.take(-1)
rescue ArgumentError => error
  puts error.message
end

begin
  numbers.drop(-1)
rescue ArgumentError => error
  puts error.message
end
```

Output:

```
[1, 2]
[3, 4]
[]
[]
[1, 2, 3, 4]
attempt to take negative size
attempt to drop negative size
```
