---
title: "stdlib/string/to_i_parens.rb"
slug: stdlib-string-to-i-parens
description: "The metorex example program stdlib/string/to_i_parens.rb and its output."
---

`tests/_examples/stdlib/string/to_i_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/to_i_parens.rb).

```metorex
puts "42".to_i
puts "  99  ".to_i
puts "hello".to_i
puts "-7".to_i
puts "3abc".to_i
puts "3.14".to_f
puts "hello".to_f

s = "world"
d = s.dup
puts d

puts "hello".gsub("l", "r")
puts "hello".sub("l", "r")
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
world
herro
herlo
true
false
```
