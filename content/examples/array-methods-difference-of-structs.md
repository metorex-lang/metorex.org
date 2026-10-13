---
title: "array_methods/difference_of_structs.rb"
slug: array-methods-difference-of-structs
description: "The metorex example program array_methods/difference_of_structs.rb and its output."
---

`tests/_examples/array_methods/difference_of_structs.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/difference_of_structs.rb){target=_blank rel=noopener}.

```metorex
Hook = Struct.new(:block, :options)
body = proc { :ran }
first = Hook.new(body, { scope: :context })
second = Hook.new(body, { scope: :context })
p first == second, first.eql?(second), first.hash == second.hash
p ([first] - [second]).size
p [first, second].uniq.size
p({ first => 1 }.key?(second))
```

Output:

```
true
true
true
0
1
true
```
