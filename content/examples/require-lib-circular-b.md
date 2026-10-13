---
title: "require/lib/circular_b.rb"
slug: require-lib-circular-b
description: "The metorex example program require/lib/circular_b.rb and its output."
---

`tests/_examples/require/lib/circular_b.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/lib/circular_b.rb).

```metorex
puts "circular_b loading"
require_relative "circular_a"
puts "circular_b done"
circular_b_var = "b"
```
