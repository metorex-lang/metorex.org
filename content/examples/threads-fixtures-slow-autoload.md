---
title: "threads/fixtures/slow_autoload.rb"
slug: threads-fixtures-slow-autoload
description: "The metorex example program threads/fixtures/slow_autoload.rb and its output."
---

`tests/_examples/threads/fixtures/slow_autoload.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/fixtures/slow_autoload.rb){target=_blank rel=noopener}.

```metorex
Holder.recorded << :pre
Thread.current[:loading] = true
sleep 0.1
module Holder
  Loaded = 1
end
Holder.recorded << :post
```
