---
title: "site/differences_native_thread.rb"
slug: site-differences-native-thread
description: "The metorex example program site/differences_native_thread.rb and its output."
---

`tests/_examples/site/differences_native_thread.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/differences_native_thread.rb){target=_blank rel=noopener}.

```metorex
waiting = Thread.new { sleep 0.2 }
sleep 0.05
p Thread.current.native_thread_id.is_a?(Integer)
p waiting.native_thread_id.class
```

Output:

```
true
NilClass
```
