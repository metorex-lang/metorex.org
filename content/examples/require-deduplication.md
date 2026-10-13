---
title: "require/deduplication.rb"
slug: require-deduplication
description: "The metorex example program require/deduplication.rb and its output."
---

`tests/_examples/require/deduplication.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/deduplication.rb).

```metorex
require_relative("lib/counter")
require_relative("lib/counter")
```

Output:

```
counter loaded
```
