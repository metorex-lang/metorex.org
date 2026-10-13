---
title: "globals/toplevel_binding/receiver.rb"
slug: globals-toplevel-binding-receiver
description: "The metorex example program globals/toplevel_binding/receiver.rb and its output."
---

`tests/_examples/globals/toplevel_binding/receiver.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/toplevel_binding/receiver.rb).

```metorex
main = TOPLEVEL_BINDING.receiver
puts main.private_methods(true).include?(:ruby2_keywords)
puts main.private_methods.include?(:ruby2_keywords)
```

Output:

```
true
true
```
