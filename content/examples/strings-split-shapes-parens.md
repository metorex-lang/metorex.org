---
title: "strings/split_shapes_parens.rb"
slug: strings-split-shapes-parens
description: "The metorex example program strings/split_shapes_parens.rb and its output."
---

`tests/_examples/strings/split_shapes_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/split_shapes_parens.rb){target=_blank rel=noopener}.

```metorex
# `split` cuts a string on whitespace, on a run of text, or on a pattern.
# A count caps the pieces and leaves the rest in the last one, and the groups
# a pattern names are kept alongside the pieces.
p(" now's  the time  ".split(' '))
p(" now's  the time  ".split(' ', 3))
p(" now's  the time  ".split(' ', -1))
p("1,2,,3,4,,".split(","))
p("1,2,,3,4,,".split(",", -1))
p("1.2.3.4".split(".", 2))
p("hello".split(""))
p("hello".split("", 2))

# A pattern keeps what its groups matched.
p("hello".split(/(el)/))
p("hi!".split(/()/))
p("hello".split(/(el)|(xx)/))
p("aBaBa".split(/(B)()()/, 2))
p("hello".split(//, -1))
p("AABCCBAA".split(/(?=B)/))
p("  a  b  c\nd  ".split(/\s+/))

# With a block each piece is handed over and the string itself is the answer.
collected = []
answered = "chunky-bacon".split("-") { |piece| collected << piece.capitalize }
p(collected)
p(answered)
```

Output:

```
["now's", "the", "time"]
["now's", "the", "time  "]
["now's", "the", "time", ""]
["1", "2", "", "3", "4"]
["1", "2", "", "3", "4", "", ""]
["1", "2.3.4"]
["h", "e", "l", "l", "o"]
["h", "ello"]
["h", "el", "lo"]
["h", "", "i", "", "!"]
["h", "el", "lo"]
["a", "B", "", "", "aBa"]
["h", "e", "l", "l", "o", ""]
["AA", "BCC", "BAA"]
["", "a", "b", "c", "d"]
["Chunky", "Bacon"]
"chunky-bacon"
```
