---
title: "ractors/local_storage_no_parens.rb"
slug: ractors-local-storage-no-parens
description: "The metorex example program ractors/local_storage_no_parens.rb and its output."
---

`tests/_examples/ractors/local_storage_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ractors/local_storage_no_parens.rb).

```metorex
# Each Ractor keeps values of its own under Symbol keys, which only that
# Ractor reads and writes. `Ractor.store_if_absent` stores what its block
# answers the first time a key is asked for.

Warning[:experimental] = false
Ractor[:setting] = 1
p Ractor[:setting], Ractor.current[:setting], Ractor["setting"]
Ractor.current[:other] = 2
p Ractor[:other]
r = Ractor.new { [Ractor[:setting], (Ractor[:mine] = 3), Ractor[:mine]] }
p r.value
p Ractor[:mine]
p Ractor.store_if_absent(:made) { |key| [key, :first] }
p Ractor.store_if_absent(:made) { |key| [key, :second] }
begin; r[:x]; rescue => e; p [e.class, e.message]; end
begin; r[:x] = 1; rescue => e; p [e.class, e.message]; end
begin; Ractor[1]; rescue => e; p [e.class, e.message]; end
begin; Ractor.store_if_absent(:y); rescue => e; p [e.class, e.message]; end
Ractor.store_if_absent("k") { 5 }
p Ractor[:k]
p Ractor.current.instance_variables, r.instance_variables, Ractor::Port.new.instance_variables
```

Output:

```
1
1
1
2
[nil, 3, 3]
nil
[nil, :first]
[nil, :first]
[RuntimeError, "Cannot get ractor local storage for non-current ractor"]
[RuntimeError, "Cannot set ractor local storage for non-current ractor"]
[TypeError, "1 is not a symbol nor a string"]
[LocalJumpError, "no block given"]
5
[]
[]
[]
```
