---
title: "strings/bytes_and_encodings_parens.rb"
slug: strings-bytes-and-encodings-parens
description: "The metorex example program strings/bytes_and_encodings_parens.rb and its output."
---

`tests/_examples/strings/bytes_and_encodings_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/bytes_and_encodings_parens.rb){target=_blank rel=noopener}.

```metorex
# Appending to a string that holds nothing but ASCII takes the other
# string's encoding, and a codepoint outside ASCII makes it a run of bytes.
held = +""
[120, 156].each { |byte| held << byte.chr }
p held.bytes
puts held.encoding.to_s

ascii = +"".force_encoding("US-ASCII")
ascii.<<(255)
puts ascii.encoding.to_s

# `initialize` takes another string's characters and encoding.
copy = +"some string"
copy.send(:initialize, "another string")
puts copy

# `setbyte` writes one byte, whatever it spells.
letter = +"\u{915}"
letter.setbyte(1, 254)
p letter.getbyte(1)

# `crypt` is the C library's one-way hash.
puts "nutmeg".crypt("Mi")
```

Output:

```
[120, 156]
ASCII-8BIT
ASCII-8BIT
another string
254
MiqkFWCm1fNJI
```
