---
title: "scanning/repeated_matches.rb"
slug: scanning-repeated-matches
description: "The metorex example program scanning/repeated_matches.rb and its output."
---

`tests/_examples/scanning/repeated_matches.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/scanning/repeated_matches.rb).

```metorex
# `scan` walks every match in a string, handing the groups to a block as one
# array, and `\G` asks each match to begin where the one before it ended.
p "cruel world".scan(/\w+/)
p "cruel world".scan(/(..)(..)/)
p "hello".scan(//)
p "one two one two".scan(/\G\w+/)
p "one two one two".scan(/\G\w+\s*/)
p "o_o".scan("o")

collected = []
"a b c".scan(/(\w) (\w)/) { |first, second| collected << [first, second] }
p collected

"hello.".scan("l") { "x" }
p $~.begin(0)
"hello.".scan("zz") { "x" }
p $~
```

Output:

```
["cruel", "world"]
[["cr", "ue"], ["l ", "wo"]]
["", "", "", "", "", ""]
["one"]
["one ", "two ", "one ", "two"]
["o", "o"]
[["a", "b"]]
3
nil
```
