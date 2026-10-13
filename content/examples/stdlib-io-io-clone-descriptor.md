---
title: "stdlib/io/io_clone_descriptor.rb"
slug: stdlib-io-io-clone-descriptor
description: "The metorex example program stdlib/io/io_clone_descriptor.rb and its output."
---

`tests/_examples/stdlib/io/io_clone_descriptor.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/io/io_clone_descriptor.rb){target=_blank rel=noopener}.

```metorex
copy = $stdout.clone
puts copy.fileno == $stdout.fileno
copy.close
puts "stdout still open"

require "tempfile"
captured = Tempfile.new("capture")
saved = $stdout.clone
$stdout.reopen(captured)
system("echo from a child")
$stdout.flush
$stdout.reopen(saved)
saved.close
captured.rewind
puts "captured #{captured.read.inspect}"
captured.close
captured.unlink
```

Output:

```
false
stdout still open
captured "from a child\n"
```
