---
title: "data_structures/hash_non_primitive_keys.rb"
slug: data-structures-hash-non-primitive-keys
description: "The metorex example program data_structures/hash_non_primitive_keys.rb and its output."
---

`tests/_examples/data_structures/hash_non_primitive_keys.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/hash_non_primitive_keys.rb){target=_blank rel=noopener}.

```metorex
a = [1, 2]
b = [3, 4]

h = {}
h[a] = "first"
h[b] = "second"
puts h[a]
puts h[b]
```

Output:

```
first
second
```
