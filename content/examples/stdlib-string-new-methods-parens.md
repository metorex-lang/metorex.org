---
title: "stdlib/string/new_methods_parens.rb"
slug: stdlib-string-new-methods-parens
description: "The metorex example program stdlib/string/new_methods_parens.rb and its output."
---

`tests/_examples/stdlib/string/new_methods_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/new_methods_parens.rb).

```metorex
# to_i
puts "42".to_i
puts "  99  ".to_i
puts "hello".to_i
puts "-7".to_i
puts "3abc".to_i

# to_f
puts "3.14".to_f
puts "hello".to_f
puts "-2.5".to_f

# dup
s = "original"
d = s.dup
puts d

# gsub
puts "hello world".gsub("o", "0")
puts "aaa".gsub("a", "bb")

# sub (replace first only)
puts "hello hello".sub("hello", "hi")

# empty?
puts "".empty?
puts "hi".empty?
```

Output:

```
42
99
0
-7
3
3.14
0.0
-2.5
original
hell0 w0rld
bbbbbb
hi hello
true
false
```
