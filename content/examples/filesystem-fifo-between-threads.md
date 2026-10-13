---
title: "filesystem/fifo_between_threads.rb"
slug: filesystem-fifo-between-threads
description: "The metorex example program filesystem/fifo_between_threads.rb and its output."
---

`tests/_examples/filesystem/fifo_between_threads.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/fifo_between_threads.rb){target=_blank rel=noopener}.

```metorex
# Opening a FIFO waits for the other end to be opened, which another thread
# of the same program may do.
path = "/tmp/metorex_fifo_#{Process.pid}"
File.mkfifo path
written = nil
read = nil
writer = Thread.new do
  file = File.open path, "w"
  written = file.syswrite "hello"
  file.close
end
reader = Thread.new do
  file = File.open path, "r"
  read = file.sysread 5
  file.close
end
writer.join
reader.join
p written
p read
File.delete path
```

Output:

```
5
"hello"
```
