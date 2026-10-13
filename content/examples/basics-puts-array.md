---
title: "basics/puts_array.rb"
slug: basics-puts-array
description: "The metorex example program basics/puts_array.rb and its output."
---

`tests/_examples/basics/puts_array.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/puts_array.rb){target=_blank rel=noopener}.

```metorex
letters = ["a", "b"]
nested = [1, [2, 3]]
empty = []
trailing = ["with newline\n"]

puts letters
puts nested
puts empty
puts trailing
puts "plain"
puts 1, letters
```

Output:

```
a
b
1
2
3
with newline
plain
1
a
b
```
