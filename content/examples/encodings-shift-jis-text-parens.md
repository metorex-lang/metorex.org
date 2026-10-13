---
title: "encodings/shift_jis_text_parens.rb"
slug: encodings-shift-jis-text-parens
description: "The metorex example program encodings/shift_jis_text_parens.rb and its output."
---

`tests/_examples/encodings/shift_jis_text_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/shift_jis_text_parens.rb).

```metorex
# Shift_JIS spells the Japanese scripts with pairs of bytes, and the
# half-width katakana with single bytes of its own. `encode` rewrites the
# bytes rather than re-tagging them, so the text reads back the same.
written = "日本語"
held = written.encode(Encoding::SHIFT_JIS)
p(held.encoding)
p(held.bytes)
p(held.length)
p(held.bytesize)
p(held.valid_encoding?)
p(held.encode(Encoding::UTF_8) == written)

# The half-width katakana take one byte each.
narrow = "｢ｦ｣".encode(Encoding::SHIFT_JIS)
p(narrow.bytes)
p(narrow.length)
p(narrow.valid_encoding?)

# A run of bytes read through the encoding it was written in.
raw = [0x93, 0xfa].pack("C*")
p(raw.force_encoding("Shift_JIS").encode(Encoding::UTF_8))

# Windows-31J spells the same characters.
p("あ".encode(Encoding::Windows_31J).bytes)

# A byte that opens no character leaves the run unreadable.
broken = [0x93].pack("C*")
p(broken.force_encoding("Shift_JIS").valid_encoding?)
```

Output:

```
#<Encoding:Shift_JIS>
[147, 250, 150, 123, 140, 234]
3
6
true
true
[162, 166, 163]
3
true
"日"
[130, 160]
false
```
