---
title: "strings/unicode_succ_no_parens.rb"
slug: strings-unicode-succ-no-parens
description: "The metorex example program strings/unicode_succ_no_parens.rb and its output."
---

`tests/_examples/strings/unicode_succ_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/unicode_succ_no_parens.rb).

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
walk = "ঙ".upto "香"
p walk.to_a.size
walk = "aa".upto "b"
p walk.to_a
walk = "1".upto "003"
p walk.to_a
walk = "9".upto "11"
p walk.to_a
walk = "b".upto "a"
p walk.to_a
walk = "aa".upto "ab"
p walk.to_a
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
