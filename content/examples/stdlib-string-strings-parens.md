---
title: "stdlib/string/strings_parens.rb"
slug: stdlib-string-strings-parens
description: "The metorex example program stdlib/string/strings_parens.rb and its output."
---

`tests/_examples/stdlib/string/strings_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/strings_parens.rb).

```metorex
s = "hello world"
puts(s.length)
puts(s.size)
puts(s.upcase)
puts(s.downcase)
puts(s.reverse)

puts("  hello  ".strip)
puts("  hello  ".strip)

parts = s.split(" ")
puts(parts.length)
puts(parts[0])
puts(parts[1])

words = "one,two,three".split(",")
puts(words.join(", "))
puts(words.join)

puts(s.slice(0, 5))
puts(s.slice(6, 5))
puts(s.slice(-5, 5))

puts(s.include?("hello"))
puts(s.include?("xyz"))
puts(s.contains?("world"))

puts(s.starts_with?("hello"))
puts(s.starts_with?("world"))
puts(s.ends_with?("world"))
puts(s.ends_with?("hello"))
```

Output:

```
11
11
HELLO WORLD
hello world
dlrow olleh
hello
hello
2
hello
world
one, two, three
onetwothree
hello
world
world
true
false
true
true
false
true
false
```
