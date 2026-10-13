---
title: "advanced/threads_wait_on_streams.rb"
slug: advanced-threads-wait-on-streams
description: "The metorex example program advanced/threads_wait_on_streams.rb and its output."
---

`tests/_examples/advanced/threads_wait_on_streams.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/threads_wait_on_streams.rb).

```metorex
# Each call below waits on a pipe that a thread writes to later, and a counter
# thread beside it shows the other threads ran while it waited.
def counted(name)
  $count = 0
  counter = Thread.new { loop { $count += 1; Thread.pass } }
  Thread.pass
  $count = 0
  result = yield
  counter.kill
  counter.join
  puts("#{name}: #{$count > 0} #{result.inspect}")
end

def late_pipe(text = "hi\n")
  reader, writer = IO.pipe
  Thread.new do
    sleep(0.2)
    writer.write(text)
    writer.close
  end
  reader
end

counted("IO#read") { late_pipe.read }
counted("IO#read with a length") { late_pipe.read(2) }
counted("IO#readpartial") { late_pipe.readpartial(10) }
counted("IO#sysread") { late_pipe.sysread(10) }
counted("IO#gets") { late_pipe.gets }
counted("IO#getc") { late_pipe.getc }
counted("IO#getbyte") { late_pipe.getbyte }
counted("IO#readchar") { late_pipe.readchar }
counted("IO#readbyte") { late_pipe.readbyte }
counted("IO#readline") { late_pipe.readline }
counted("IO#readlines") { late_pipe("a\nb\n").readlines }
counted("IO#each_line") { late_pipe("a\nb\n").each_line.to_a }
counted("IO#each_byte") { late_pipe("ab").each_byte.to_a }
counted("IO#each_char") { late_pipe("ab").each_char.to_a }
counted("IO#wait_readable") { late_pipe.wait_readable.class }
counted("IO#wait") { late_pipe.wait(IO::READABLE).class }
counted("IO.select") { IO.select([late_pipe])[0].size }
counted("Kernel#select") { select([late_pipe])[0].size }
counted("IO.copy_stream") { IO.copy_stream(late_pipe, IO::NULL) }

counted("Kernel#gets") { $stdin.reopen(late_pipe); gets }
counted("Kernel#readline") { $stdin.reopen(late_pipe); readline }
counted("Kernel#readlines") { $stdin.reopen(late_pipe("a\nb\n")); readlines(chomp: true) }

def full_pipe
  reader, writer = IO.pipe
  writer.write_nonblock("x" * 4096, exception: false) until writer.write_nonblock("x", exception: false) == :wait_writable
  Thread.new do
    sleep(0.2)
    reader.read
  end
  writer
end

counted("IO#write") { writer = full_pipe; writer.write("y" * 100_000).tap { writer.close } }
counted("IO#syswrite") { writer = full_pipe; (writer.syswrite("y" * 4096) > 0).tap { writer.close } }
counted("IO#wait_writable") { writer = full_pipe; writer.wait_writable.class.tap { writer.close } }

# With no other thread to run, a read and a write wait on the descriptor for
# a child process to write or read.
reader, writer = IO.pipe
child = spawn("sleep 0.2; printf hi", out: writer)
writer.close
p(reader.getc)
Process.wait(child)

reader, writer = IO.pipe
writer.write_nonblock("x" * 4096, exception: false) until writer.write_nonblock("x", exception: false) == :wait_writable
child = spawn("sleep 0.2; cat > /dev/null", in: reader)
reader.close
p(writer.write("y" * 100_000))
writer.close
Process.wait(child)
```

Output:

```
IO#read: true "hi\n"
IO#read with a length: true "hi"
IO#readpartial: true "hi\n"
IO#sysread: true "hi\n"
IO#gets: true "hi\n"
IO#getc: true "h"
IO#getbyte: true 104
IO#readchar: true "h"
IO#readbyte: true 104
IO#readline: true "hi\n"
IO#readlines: true ["a\n", "b\n"]
IO#each_line: true ["a\n", "b\n"]
IO#each_byte: true [97, 98]
IO#each_char: true ["a", "b"]
IO#wait_readable: true IO
IO#wait: true IO
IO.select: true 1
Kernel#select: true 1
IO.copy_stream: true 3
Kernel#gets: true "hi\n"
Kernel#readline: true "hi\n"
Kernel#readlines: true ["a", "b"]
IO#write: true 100000
IO#syswrite: true true
IO#wait_writable: true IO
"h"
100000
```
