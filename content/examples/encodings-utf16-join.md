---
title: "encodings/utf16_join.rb"
slug: encodings-utf16-join
description: "The metorex example program encodings/utf16_join.rb and its output."
---

`tests/_examples/encodings/utf16_join.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/utf16_join.rb){target=_blank rel=noopener}.

```metorex
word = "carté".encode("UTF-16LE")
newline = "\n".encode("UTF-16LE")
edited = String.new("#{"  ".encode("UTF-16LE")}#{word}")
edited[0, 1] = "!".encode("UTF-16LE")
one = [edited].join(newline)
p [one.encoding, one.encode("UTF-8")]
two = [edited, word].join(newline)
p [two.encoding, two.encode("UTF-8")]
head = "--- 1 ----\n".encode("UTF-16LE")
head << one
p head.encode("UTF-8")
```

Output:

```
[#<Encoding:UTF-16LE>, "! carté"]
[#<Encoding:UTF-16LE>, "! carté\ncarté"]
"--- 1 ----\n! carté"
```
