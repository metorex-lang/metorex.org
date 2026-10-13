---
title: "encodings/japanese_text.rb"
slug: encodings-japanese-text
description: "The metorex example program encodings/japanese_text.rb and its output."
---

`tests/_examples/encodings/japanese_text.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/japanese_text.rb).

```metorex
# EUC-JP spells a character in two bytes, or three for the ones that sit in
# the second plane, and `encode` carries text either way.
p "\u{3042}".encode("EUC-JP").bytes
p "é".encode("EUC-JP").bytes
p "\u{3042}".encode("EUC-JP").encode("UTF-8")
p "\u{3042}".encode("EUC-JP").encoding

# A character the answer cannot show is named by the bytes it is spelled with.
p "\u{3042}".encode("EUC-JP").inspect
p ("a" + "\u{3042}" + "b").encode("EUC-JP").inspect

# A character EUC-JP has no bytes for is refused.
begin
  "\u{1F600}".encode("EUC-JP")
rescue Encoding::UndefinedConversionError => trouble
  p trouble.message
end

# macCyrillic lays its letters out one byte to a character.
p "А".encode("macCyrillic").bytes

# A converter carries text one call at a time, and ISO-2022-JP opens a run of
# two-byte characters with an escape and closes it when the text is done.
converter = Encoding::Converter.new("utf-8", "iso-2022-jp")
p converter.convert("\u{9999}").bytes
p converter.finish.bytes
```

Output:

```
[164, 162]
[143, 171, 177]
"あ"
#<Encoding:EUC-JP>
"\"\\x{A4A2}\""
"\"a\\x{A4A2}b\""
"U+1F600 from UTF-8 to EUC-JP"
[128]
[27, 36, 66, 57, 97]
[27, 40, 66]
```
