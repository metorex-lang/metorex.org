---
title: "stdlib/io/io.rb"
slug: stdlib-io-io
description: "The metorex example program stdlib/io/io.rb and its output."
---

`tests/_examples/stdlib/io/io.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/io/io.rb){target=_blank rel=noopener}.

```metorex
# IO and print functions demonstration

# puts adds newline
puts "Hello from puts"

# print does not add newline
print "Hello "
print "from "
print "print"
puts ""

# p shows inspect representation
p 42

# File operations
path = "tests/_examples/stdlib/io/io_temp_noparen.txt"
File.write(path, "Hello from file!")
puts File.read(path)
puts File.exist?(path)

# Cleanup
File.write(path, "")
```

Output:

```
Hello from puts
Hello from print
42
Hello from file!
true
```
