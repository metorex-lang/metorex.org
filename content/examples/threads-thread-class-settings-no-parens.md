---
title: "threads/thread_class_settings_no_parens.rb"
slug: threads-thread-class-settings-no-parens
description: "The metorex example program threads/thread_class_settings_no_parens.rb and its output."
---

`tests/_examples/threads/thread_class_settings_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/thread_class_settings_no_parens.rb){target=_blank rel=noopener}.

```metorex
# `Thread.report_on_exception=` is remembered and read back, a thread shows
# none of the interpreter's own slots among its instance variables, and a
# SizedQueue is a kind of Queue.

p Thread.report_on_exception
Thread.report_on_exception = false
p Thread.report_on_exception
quiet = Thread.new { raise "stopped" }
p quiet.report_on_exception
begin
  quiet.join
rescue RuntimeError => trouble
  p trouble.message
end
Thread.report_on_exception = true

finished = Thread.new { 1 }
finished.join
p finished.instance_variables

p Thread::SizedQueue.superclass
p SizedQueue.new(1).is_a?(Queue)
```

Output:

```
true
false
false
"stopped"
[]
Thread::Queue
true
```
