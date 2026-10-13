---
title: "require/extension/explicit.rb"
slug: require-extension-explicit
description: "The metorex example program require/extension/explicit.rb and its output."
---

`tests/_examples/require/extension/explicit.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/extension/explicit.rb).

```metorex
# Test that require_relative works with explicit .rb extension
require_relative "../lib/helper.rb"
puts HELPER_VALUE
puts helper_method()
```

Output:

```
from helper
helper method called
```
