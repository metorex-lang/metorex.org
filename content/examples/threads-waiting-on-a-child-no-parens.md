---
title: "threads/waiting_on_a_child_no_parens.rb"
slug: threads-waiting-on-a-child-no-parens
description: "The metorex example program threads/waiting_on_a_child_no_parens.rb and its output."
---

`tests/_examples/threads/waiting_on_a_child_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/waiting_on_a_child_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A thread waiting on a child process lets the other threads run, so the
# main thread can make the file each child is waiting to see.

require "tmpdir"

def wait_for path
  "while [ ! -e #{path} ]; do sleep 0.01; done"
end

def release thread, path
  Thread.pass until thread.status == "sleep"
  File.write path, ""
  thread.value
end

Dir.mktmpdir do |directory|
  path = File.join directory, "system"
  p release(Thread.new { system wait_for path }, path)

  path = File.join directory, "backticks"
  p release(Thread.new { `#{wait_for path}; echo seen` }, path)

  path = File.join directory, "wait"
  child = spawn wait_for path
  waiter = Thread.new { Process.wait child }
  p release(waiter, path) == child
end
```

Output:

```
true
"seen\n"
true
```
