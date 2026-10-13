---
title: "data_structures/array_splat/literals_no_parens.rb"
slug: data-structures-array-splat-literals-no-parens
description: "The metorex example program data_structures/array_splat/literals_no_parens.rb and its output."
---

`tests/_examples/data_structures/array_splat/literals_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/array_splat/literals_no_parens.rb).

```metorex
# A splat inside an array literal splices its elements in place.

def collect(first, *rest)
  [first, *rest]
end

puts collect(:one).inspect
puts collect(:one, :two, :three).inspect

middle = [2, 3]
spliced = [1, *middle, 4]
puts spliced.inspect
copied = [*middle]
puts copied.inspect
from_nil = [*nil]
puts from_nil.inspect
with_string = [0, *"solo"]
puts with_string.inspect

nested = [[1, 2], [3]]
flat = [*nested]
puts flat.inspect
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
