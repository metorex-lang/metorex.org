---
title: "encodings/symbol_encodings.rb"
slug: encodings-symbol-encodings
description: "The metorex example program encodings/symbol_encodings.rb and its output."
---

`tests/_examples/encodings/symbol_encodings.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/symbol_encodings.rb).

```metorex
# A Symbol spelled in ASCII from an ASCII-compatible encoding reads as
# US-ASCII, one spelling anything else keeps its string's encoding, and one
# from an encoding that is not ASCII-compatible keeps that encoding even
# when it spells only ASCII.
p "plain".to_sym.encoding
p "café".to_sym.encoding
wide = "test_symbol".encode(Encoding::UTF_16LE).to_sym
p wide.encoding
p wide.to_s.encoding
p wide.to_s.bytesize
```

Output:

```
#<Encoding:US-ASCII>
#<Encoding:UTF-8>
#<Encoding:UTF-16LE>
#<Encoding:UTF-16LE>
22
```
