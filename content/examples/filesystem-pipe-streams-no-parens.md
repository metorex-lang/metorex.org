---
title: "filesystem/pipe_streams_no_parens.rb"
slug: filesystem-pipe-streams-no-parens
description: "The metorex example program filesystem/pipe_streams_no_parens.rb and its output."
---

`tests/_examples/filesystem/pipe_streams_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/pipe_streams_no_parens.rb).

```metorex
reader, writer = IO.pipe

puts reader.fileno > 2
puts writer.fileno > 2
puts reader.class
puts reader.closed?

writer.write "over the pipe\n"
writer.close

ready = IO.select [reader], nil, nil, 1
puts ready[0].size
puts reader.gets
puts reader.eof?

reader.close
puts reader.closed?

spare, sender = IO.pipe
spare.close_read
puts spare.closed?
sender.close
```

Output:

```
true
true
IO
false
1
over the pipe
true
true
true
```
