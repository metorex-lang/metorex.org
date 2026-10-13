---
title: "globals/toplevel_binding/toplevel_binding.rb"
slug: globals-toplevel-binding-toplevel-binding
description: "The metorex example program globals/toplevel_binding/toplevel_binding.rb and its output."
---

`tests/_examples/globals/toplevel_binding/toplevel_binding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/toplevel_binding/toplevel_binding.rb){target=_blank rel=noopener}.

```metorex
puts TOPLEVEL_BINDING.nil?
puts to_s
puts eval("to_s", TOPLEVEL_BINDING)
puts eval "to_s", TOPLEVEL_BINDING
```

Output:

```
false
main
main
main
```
