---
title: "require/diamond.rb"
slug: require-diamond
description: "The metorex example program require/diamond.rb and its output."
---

`tests/_examples/require/diamond.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/diamond.rb){target=_blank rel=noopener}.

```metorex
# Test diamond dependency: both B and C require D
# D should only be loaded once
require_relative "lib/diamond_b"
require_relative "lib/diamond_c"
puts "main done"
```

Output:

```
diamond_d loaded
diamond_b loaded
diamond_c loaded
main done
```
