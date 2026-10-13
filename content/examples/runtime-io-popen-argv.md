---
title: "runtime/io_popen_argv.rb"
slug: runtime-io-popen-argv
description: "The metorex example program runtime/io_popen_argv.rb and its output."
---

`tests/_examples/runtime/io_popen_argv.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/io_popen_argv.rb).

```metorex
require "rbconfig"

interpreter = RbConfig.ruby

output = IO.popen([interpreter, "-n", "-e", 'print "got: ", $_'], "r+") do |io|
  io.puts "a line"
  io.close_write
  io.read
end
puts output

second = IO.popen([interpreter, "-e", 'print "no input"'], "r+") do |io|
  io.close_write
  io.read
end
puts second
puts $?.exitstatus
```

Output:

```
got: a line
no input
0
```
