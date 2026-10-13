---
title: "encodings/utf16_string_building.rb"
slug: encodings-utf16-string-building
description: "The metorex example program encodings/utf16_string_building.rb and its output."
---

`tests/_examples/encodings/utf16_string_building.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/utf16_string_building.rb).

```metorex
space = " ".encode("UTF-16LE")
word = "carté".encode("UTF-16LE")
newline = "\n".encode("UTF-16LE")

joined = "#{space}#{word}"
p [joined.encoding, joined.encode("UTF-8")]

built = String.new("#{space}#{word.chomp}")
p [built.encoding, built.encode("UTF-8")]

built[0, 1] = "-".encode("UTF-16LE")
p built.encode("UTF-8")

list = [space + "a".encode("UTF-16LE"), space + "b".encode("UTF-16LE")]
list[1, 0] = "+".encode("UTF-16LE") + word
p list.map { |line| line.encode("UTF-8") }

together = list.join(newline)
p [together.encoding, together.encode("UTF-8")]

head = "@@ -1 +1 @@\n".encode("UTF-16LE")
head << together
p head.encode("UTF-8")

two = String.new("#{"  ".encode("UTF-16LE")}#{word.chomp}")
p [two.encoding, two.encode("UTF-8")]

p [word[0, 1].encode("UTF-8"), word[1..2].encode("UTF-8"), word[-1].encode("UTF-8")]
```

Output:

```
[#<Encoding:UTF-16LE>, " carté"]
[#<Encoding:UTF-16LE>, " carté"]
"-carté"
[" a", "+carté", " b"]
[#<Encoding:UTF-16LE>, " a\n+carté\n b"]
"@@ -1 +1 @@\n a\n+carté\n b"
[#<Encoding:UTF-16LE>, "  carté"]
["c", "ar", "é"]
```
