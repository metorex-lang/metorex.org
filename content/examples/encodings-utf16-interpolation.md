---
title: "encodings/utf16_interpolation.rb"
slug: encodings-utf16-interpolation
description: "The metorex example program encodings/utf16_interpolation.rb and its output."
---

`tests/_examples/encodings/utf16_interpolation.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/utf16_interpolation.rb){target=_blank rel=noopener}.

```metorex
plain = "items".encode("UTF-16LE")
accented = "itéms".encode("UTF-16LE")
space = " ".encode("UTF-16LE")
p "#{plain}".encoding
p "#{space}#{plain}".encoding
p "#{space}#{accented}".encoding
p String.new("#{space}#{plain}").encoding
```

Output:

```
#<Encoding:UTF-16LE>
#<Encoding:UTF-16LE>
#<Encoding:UTF-16LE>
#<Encoding:UTF-16LE>
```
