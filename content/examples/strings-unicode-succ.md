---
title: "strings/unicode_succ.rb"
slug: strings-unicode-succ
description: "The metorex example program strings/unicode_succ.rb and its output."
---

`tests/_examples/strings/unicode_succ.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/unicode_succ.rb){target=_blank rel=noopener}.

```metorex
# `succ` steps a letter or digit outside ASCII to the next of its kind, and
# wraps one at the end of its run, carrying into the place to its left.
p "ঙ".succ
p "হ".succ
p "٩".succ
p "あ".succ
p "zz99".succ
# A byte that is not a character in its encoding steps as a byte.
p "(\xFF".b.succ
p "\xFF".b.succ
p "".succ

# `upto` stops once a step grows longer than the end, which bounds a walk
# through characters outside ASCII.
p "ঙ".upto("香").to_a.size
p "aa".upto("b").to_a
p "1".upto("003").to_a
p "9".upto("11").to_a
p "b".upto("a").to_a
p "aa".upto("ab").to_a
```

Output:

```
"চ"
"শশ"
"١٠"
"ぃ"
"aaa00"
")\x00"
"\x01\x00"
""
31
["aa"]
["1", "2", "3"]
["9", "10", "11"]
[]
["aa", "ab"]
```
