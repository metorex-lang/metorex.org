---
title: "stdlib/string/format_parens.rb"
slug: stdlib-string-format-parens
description: "The metorex example program stdlib/string/format_parens.rb and its output."
---

`tests/_examples/stdlib/string/format_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/format_parens.rb).

```metorex
puts("hello %s" % "world")
puts("num: %d" % 42)
puts("pi: %.2f" % 3.14159)
puts("hex: %x" % 255)
puts("%s has %d items" % ["cart", 5])
puts("100%% complete: %s" % "done")
puts("%p" % "test")
puts("%05d" % 42)
puts("%-10s|" % "left")
```

Output:

```
hello world
num: 42
pi: 3.14
hex: ff
cart has 5 items
100% complete: done
"test"
00042
left      |
```
