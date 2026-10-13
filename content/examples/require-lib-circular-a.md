---
title: "require/lib/circular_a.rb"
slug: require-lib-circular-a
description: "The metorex example program require/lib/circular_a.rb and its output."
---

`tests/_examples/require/lib/circular_a.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/lib/circular_a.rb).

```metorex
puts "circular_a loading"
require_relative "circular_b"
puts "circular_a done"
circular_a_var = "a"
```
