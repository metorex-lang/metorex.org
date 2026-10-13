---
title: "stdlib_libraries/first_thread.rb"
slug: stdlib-libraries-first-thread
description: "The metorex example program stdlib_libraries/first_thread.rb and its output."
---

`tests/_examples/stdlib_libraries/first_thread.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/first_thread.rb){target=_blank rel=noopener}.

```metorex
# On Linux the program runs on the process's first thread, with no other
# thread beside it, so a call such as `setgroups` has no thread to signal.
p(Dir.children("/proc/self/task").length)
```
