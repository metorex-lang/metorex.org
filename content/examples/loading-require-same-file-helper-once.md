---
title: "loading/require_same_file/helper_once.rb"
slug: loading-require-same-file-helper-once
description: "The metorex example program loading/require_same_file/helper_once.rb and its output."
---

`tests/_examples/loading/require_same_file/helper_once.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/loading/require_same_file/helper_once.rb).

```metorex
LOADS = (defined?(LOADS) ? LOADS : []) unless defined?(LOADS)
LOADS << :loaded
```
