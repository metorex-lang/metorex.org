---
title: "errors/io_wait/constants_parens.rb"
slug: errors-io-wait-constants-parens
description: "The metorex example program errors/io_wait/constants_parens.rb and its output."
---

`tests/_examples/errors/io_wait/constants_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/io_wait/constants_parens.rb).

```metorex
puts(IO::EAGAINWaitReadable.superclass)
puts(IO::EAGAINWaitReadable.ancestors.include?(IO::WaitReadable))
puts(IO::EAGAINWaitReadable.equal?(IO::EWOULDBLOCKWaitReadable))

puts(IO::EAGAINWaitWritable.superclass)
puts(IO::EAGAINWaitWritable.ancestors.include?(IO::WaitWritable))
puts(IO::EAGAINWaitWritable.equal?(IO::EWOULDBLOCKWaitWritable))

puts(IO::EAGAINWaitReadable.ancestors.include?(IO::WaitWritable))
puts(Errno::EAGAIN.equal?(Errno::EWOULDBLOCK))

error = IO::EAGAINWaitReadable.new("would block")
puts(error.class)
puts(error.is_a?(Errno::EAGAIN))
puts(error.is_a?(IO::WaitReadable))
```

Output:

```
Errno::EAGAIN
true
true
Errno::EAGAIN
true
true
false
true
IO::EAGAINWaitReadable
true
true
```
