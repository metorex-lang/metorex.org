---
title: "advanced/native_thread_ids.rb"
slug: advanced-native-thread-ids
description: "The metorex example program advanced/native_thread_ids.rb and its output."
---

`tests/_examples/advanced/native_thread_ids.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/native_thread_ids.rb){target=_blank rel=noopener}.

```metorex
main_id = Thread.main.native_thread_id
p(main_id.class)
p(main_id.positive?)
p(main_id == Thread.main.native_thread_id)
waiting = Thread.new { sleep }
Thread.pass until waiting.status == "sleep"
p(waiting.native_thread_id != main_id)
waiting.kill
waiting.join
p(waiting.native_thread_id)
finished = Thread.new { Thread.current.native_thread_id.class }
p(finished.value)
p(finished.native_thread_id)
fresh = Thread.new { }
p(fresh.native_thread_id != main_id)
fresh.join

# The settings for running threads M:N are accepted.
require("rbconfig")
settings = { "RUBY_MN_THREADS" => "1", "RUBY_MAX_CPU" => "2" }
system(settings, RbConfig.ruby, "-e", "p Thread.new { :ran }.value")
p($?.success?)
```

Output:

```
Integer
true
true
true
nil
Integer
nil
true
:ran
true
```
