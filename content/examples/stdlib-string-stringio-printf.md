---
title: "stdlib/string/stringio_printf.rb"
slug: stdlib-string-stringio-printf
description: "The metorex example program stdlib/string/stringio_printf.rb and its output."
---

`tests/_examples/stdlib/string/stringio_printf.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/stringio_printf.rb){target=_blank rel=noopener}.

```metorex
require "stringio"

io = StringIO.new ""
io.write "start:"
printf io, " %s-%d", "value", 7
io << " shovelled"
io.print " printed"
io.puts ""
puts io.string.inspect

reader = StringIO.new "first\nsecond\n"
puts reader.gets.inspect
puts reader.read.inspect
puts reader.read.inspect
reader.rewind
puts reader.read(5).inspect

printf "%s and %s\n", "one", "two"
Kernel.printf "%d\n", 42

puts require("stringio").inspect
puts Kernel.private_instance_methods.include? :printf

path = "/tmp/metorex_file_new_#{Process.pid}.txt"
handle = File.new path, "w"
handle.write "written"
handle.close
puts File.read(path)
File.delete path
```

Output:

```
"start: value-7 shovelled printed\n"
"first\n"
"second\n"
""
"first"
one and two
42
false
true
written
```
