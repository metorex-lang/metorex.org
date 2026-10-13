---
title: "basics/array_delete.rb"
slug: basics-array-delete
description: "The metorex example program basics/array_delete.rb and its output."
---

`tests/_examples/basics/array_delete.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/array_delete.rb).

```metorex
a = [1, 2, 3, 2, 4]
puts a.delete(2)
puts a.length
puts a.delete(99).nil?
puts a.delete 1
puts a.length
puts a.include?(1)
```

Output:

```
2
3
true
1
2
false
```
