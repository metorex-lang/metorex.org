---
title: "require/circular.rb"
slug: require-circular
description: "The metorex example program require/circular.rb and its output."
---

`tests/_examples/require/circular.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/circular.rb).

```metorex
# Test that circular requires don't cause infinite loops
# circular_a requires circular_b, circular_b requires circular_a
# The second require_relative should be a no-op due to deduplication
require_relative "lib/circular_a"
puts "main done"
```

Output:

```
circular_a loading
circular_b loading
circular_b done
circular_a done
main done
```
