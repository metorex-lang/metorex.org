---
title: "require/nested.rb"
slug: require-nested
description: "The metorex example program require/nested.rb and its output."
---

`tests/_examples/require/nested.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/nested.rb){target=_blank rel=noopener}.

```metorex
require_relative("lib/util_b")
puts "main file"
```

Output:

```
util_a loaded
util_b loaded
main file
```
