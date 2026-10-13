---
title: "require/extension/auto_detect.rb"
slug: require-extension-auto-detect
description: "The metorex example program require/extension/auto_detect.rb and its output."
---

`tests/_examples/require/extension/auto_detect.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/extension/auto_detect.rb).

```metorex
# Test that require_relative auto-detects .rb extension
# Requiring "lib/helper" should find "lib/helper.rb"
require_relative "../lib/helper"
puts HELPER_VALUE
puts helper_method()
```

Output:

```
from helper
helper method called
```
