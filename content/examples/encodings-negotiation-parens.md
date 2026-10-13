---
title: "encodings/negotiation_parens.rb"
slug: encodings-negotiation-parens
description: "The metorex example program encodings/negotiation_parens.rb and its output."
---

`tests/_examples/encodings/negotiation_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/negotiation_parens.rb).

```metorex
# `Encoding.compatible?` answers the encoding two objects can be read in
# together, and a pattern reports the encoding it is read in.
p(Encoding.compatible?("abc", "def"))
p(Encoding.compatible?("abc".dup.force_encoding("us-ascii"), "あ"))
p(Encoding.compatible?("あ", "\xff".dup.force_encoding("binary")))
p(Encoding.compatible?("abc", "1234".dup.force_encoding("utf-16le")))
p(Encoding.compatible?(Encoding::UTF_8, Encoding::US_ASCII))
p(Encoding.compatible?(Object.new, "abc"))

p(/abc/.encoding)
p(/\u{3042}/.encoding)
p(/abc/n.encoding)
p(/\xc2\xa1/n.encoding)
p(/abc/u.encoding)

japanese = "あ".encode("euc-jp")
p(Regexp.new(japanese).encoding)
```

Output:

```
#<Encoding:UTF-8>
#<Encoding:UTF-8>
nil
nil
#<Encoding:UTF-8>
nil
#<Encoding:US-ASCII>
#<Encoding:UTF-8>
#<Encoding:US-ASCII>
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:UTF-8>
#<Encoding:EUC-JP>
```
