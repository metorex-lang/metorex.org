---
title: "data_structures/hash_primitive_keys.rb"
slug: data-structures-hash-primitive-keys
description: "The metorex example program data_structures/hash_primitive_keys.rb and its output."
---

`tests/_examples/data_structures/hash_primitive_keys.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/hash_primitive_keys.rb).

```metorex
h = {}
h[nil] = "n"
h[true] = "t"
h[false] = "f"
h[:sym] = "s"
h[42] = "i"
h[3.5] = "fl"
h["str"] = "st"

puts h.keys.length
puts h.values.length
puts h[nil]
puts h[true]
puts h[false]
puts h[:sym]
puts h[42]
puts h[3.5]
puts h["str"]
```

Output:

```
7
7
n
t
f
s
i
fl
st
```
