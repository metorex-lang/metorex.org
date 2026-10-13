---
title: "builtins/packed_text.rb"
slug: builtins-packed-text
description: "The metorex example program builtins/packed_text.rb and its output."
---

`tests/_examples/builtins/packed_text.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/packed_text.rb){target=_blank rel=noopener}.

```metorex
# `pack("U")` writes a code point in UTF-8, carrying on past the range Unicode
# names the way Ruby does, and the answer is tagged UTF-8.
p [0x41, 0x3042].pack("U*")
p [0x41, 0x3042].pack("U*").encoding
p [0x00110000].pack("U").bytes
p [0x7FFFFFFF].pack("U").bytes
begin
  [2**32].pack("U")
rescue RangeError => trouble
  p trouble.class
end

# Uuencoding and base64 answer ASCII, and a count names how many bytes one
# uuencoded line holds, rounded down to whole groups of three.
p ["abcdefghijklm"].pack("u7")
p ["abc"].pack("u").encoding
p ["abc"].pack("m").encoding
p [65].pack("C").encoding

# Reading back finds the code points the bytes spell, and bytes that spell no
# character are refused.
p "あ".unpack("U")
begin
  "\xE3".unpack("U")
rescue ArgumentError => trouble
  p trouble.class
end

# A width modifier belongs only to a directive with a platform width.
begin
  "abc".unpack("a!")
rescue ArgumentError => trouble
  p trouble.message
end
```

Output:

```
"Aあ"
#<Encoding:UTF-8>
[244, 144, 128, 128]
[253, 191, 191, 191, 191, 191]
RangeError
"&86)C9&5F\n&9VAI:FML\n!;0``\n"
#<Encoding:US-ASCII>
#<Encoding:US-ASCII>
#<Encoding:BINARY (ASCII-8BIT)>
[12354]
ArgumentError
"'!' allowed only after types sSiIlLqQjJ"
```
