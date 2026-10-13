---
title: "require/return_values.rb"
slug: require-return-values
description: "The metorex example program require/return_values.rb and its output."
---

`tests/_examples/require/return_values.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/return_values.rb){target=_blank rel=noopener}.

```metorex
result1 = require_relative("lib/helper")
puts result1
result2 = require_relative("lib/helper")
puts result2
```

Output:

```
true
false
```
