---
title: "strings/unpack_offsets_parens.rb"
slug: strings-unpack-offsets-parens
description: "The metorex example program strings/unpack_offsets_parens.rb and its output."
---

`tests/_examples/strings/unpack_offsets_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/unpack_offsets_parens.rb){target=_blank rel=noopener}.

```metorex
# `unpack` reads from a byte offset when it is given one, and the offset must
# name a place inside the string.
held = "ZZABCD"
p(held.unpack1("x3C", offset: 2))
p(held.unpack("a4", offset: 2))
p("ZZZZaG9nZWZ1Z2E=".unpack1("m", offset: 4))
p("؈".unpack("CC"))
p("؈".unpack1("C", offset: 1))
p("a".unpack1("C", offset: 1))

begin
  "a".unpack1("C", offset: -1)
rescue ArgumentError => trouble
  p(trouble.message)
end

begin
  "a".unpack1("C", offset: 2)
rescue ArgumentError => trouble
  p(trouble.message)
end
```

Output:

```
68
["ABCD"]
"hogefuga"
[216, 136]
136
nil
"offset can't be negative"
"offset outside of string"
```
