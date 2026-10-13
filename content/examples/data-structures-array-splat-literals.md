---
title: "data_structures/array_splat/literals.rb"
slug: data-structures-array-splat-literals
description: "The metorex example program data_structures/array_splat/literals.rb and its output."
---

`tests/_examples/data_structures/array_splat/literals.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/array_splat/literals.rb){target=_blank rel=noopener}.

```metorex
# A splat inside an array literal splices its elements in place.

def collect(first, *rest)
  [first, *rest]
end

puts collect(:one).inspect
puts collect(:one, :two, :three).inspect

middle = [2, 3]
puts([1, *middle, 4].inspect)
puts([*middle].inspect)
puts([*nil].inspect)
puts([0, *"solo"].inspect)

nested = [[1, 2], [3]]
puts([*nested].inspect)
```

Output:

```
[:one]
[:one, :two, :three]
[1, 2, 3, 4]
[2, 3]
[]
[0, "solo"]
[[1, 2], [3]]
```
