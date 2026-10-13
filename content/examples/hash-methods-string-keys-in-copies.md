---
title: "hash_methods/string_keys_in_copies.rb"
slug: hash-methods-string-keys-in-copies
description: "The metorex example program hash_methods/string_keys_in_copies.rb and its output."
---

`tests/_examples/hash_methods/string_keys_in_copies.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/hash_methods/string_keys_in_copies.rb).

```metorex
# A copy of a hash with String keys keeps its own keys: adding to the copy
# or to the original leaves the other as it was.
original = { "alpha" => 1 }
copied = original.dup
copied["beta"] = 2
original["gamma"] = 3
cloned = original.clone
cloned["delta"] = 4
p(original.keys)
p(copied.keys)
p(cloned.keys)
p(original.keys.map(&:frozen?))
many = {}
1_000.times { |step| many["key#{step}"] = step }
p([many.size, many["key999"], many.keys.last.frozen?])
```

Output:

```
["alpha", "gamma"]
["alpha", "beta"]
["alpha", "gamma", "delta"]
[true, true]
[1000, 999, true]
```
