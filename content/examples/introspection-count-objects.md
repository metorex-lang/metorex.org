---
title: "introspection/count_objects.rb"
slug: introspection-count-objects
description: "The metorex example program introspection/count_objects.rb and its output."
---

`tests/_examples/introspection/count_objects.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/count_objects.rb){target=_blank rel=noopener}.

```metorex
counted = ObjectSpace.count_objects
p counted.keys.first(5)
p counted[:TOTAL] >= counted[:T_OBJECT] + counted[:T_CLASS] + counted[:T_MODULE]
p counted[:T_CLASS].positive?
held = { stale: 1 }
p ObjectSpace.count_objects(held).equal?(held)
p held.key?(:stale)
p GC.stat(:heap_live_slots).positive?
p [false.object_id, true.object_id, nil.object_id]
```

Output:

```
[:TOTAL, :FREE, :T_OBJECT, :T_CLASS, :T_MODULE]
true
true
true
true
true
[0, 20, 4]
```
