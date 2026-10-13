---
title: "basics/string_methods.rb"
slug: basics-string-methods
description: "The metorex example program basics/string_methods.rb and its output."
---

`tests/_examples/basics/string_methods.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/string_methods.rb).

```metorex
# String Methods Example
# This example demonstrates basic string manipulation methods

puts "=== Basic String Methods ==="

# upcase and downcase
name = "Alice"
puts name.upcase()
puts name.downcase()

# trim - removes leading and trailing whitespace
greeting = "  Hello, World!  "
puts greeting.strip()

# reverse - reverses the string
message = "Metorex"
puts message.reverse()

# length - gets the string length
text = "Programming"
puts text.length()

puts ""
puts "=== String Inspection Methods ==="

# chars - returns an array of characters
word = "Hi"
chars_array = word.chars()
puts chars_array[0]
puts chars_array[1]

# bytes - returns an array of byte values
simple = "AB"
bytes_array = simple.bytes()
puts bytes_array[0]
puts bytes_array[1]
```

Output:

```
=== Basic String Methods ===
ALICE
alice
Hello, World!
xeroteM
11

=== String Inspection Methods ===
H
i
65
66
```
