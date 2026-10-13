---
title: "strings/byte_sets_parens.rb"
slug: strings-byte-sets-parens
description: "The metorex example program strings/byte_sets_parens.rb and its output."
---

`tests/_examples/strings/byte_sets_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/byte_sets_parens.rb){target=_blank rel=noopener}.

```metorex
# A run of bytes spliced into an ASCII literal keeps its encoding, and a
# `tr`-style set whose bytes are not characters in that encoding is refused.
high = [0xFF].pack("C")
spliced = "\x00 - #{high}"
p(spliced.bytes)
p(spliced.encoding)
p(spliced.valid_encoding?)

as_text = spliced.force_encoding("utf-8")
p(as_text.valid_encoding?)

begin
  "hello".delete(as_text)
rescue ArgumentError => problem
  puts(problem.message)
end

begin
  "hello".delete("h-e")
rescue ArgumentError => problem
  puts(problem.message)
end

p("hello".delete("l"))
```

Output:

```
[0, 32, 45, 32, 255]
#<Encoding:BINARY (ASCII-8BIT)>
true
false
invalid byte sequence in UTF-8
invalid range "h-e" in string transliteration
"heo"
```
