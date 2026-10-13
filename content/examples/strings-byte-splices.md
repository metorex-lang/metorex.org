---
title: "strings/byte_splices.rb"
slug: strings-byte-splices
description: "The metorex example program strings/byte_splices.rb and its output."
---

`tests/_examples/strings/byte_splices.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/byte_splices.rb){target=_blank rel=noopener}.

```metorex
# `bytesplice` replaces a run of bytes in place, counting positions in bytes
# rather than in characters, and refuses an offset inside a character.
greeting = +"hello"
p greeting.bytesplice 0, 1, "j"
p greeting

p (+"hello").bytesplice 1..2, "HELLO", 0..1
p (+"hello").bytesplice 0, 0, "say "

japanese = +"こんにちは"
p japanese.bytesplice 0, 3, "xxx"

begin
  (+"こんにちは").bytesplice 1, 0, "x"
rescue IndexError => problem
  puts problem.message
end

begin
  (+"hello").bytesplice 6, 0, "x"
rescue IndexError => problem
  puts problem.message
end

begin
  (+"hello").bytesplice -6...-6, "x"
rescue RangeError => problem
  puts problem.message
end

begin
  "frozen".freeze.bytesplice 0, 1, "x"
rescue FrozenError => problem
  puts problem.message
end
```

Output:

```
"jello"
"jello"
"hHElo"
"say hello"
"xxxんにちは"
offset 1 does not land on character boundary
index 6 out of string
-6...-6 out of range
can't modify frozen String: "frozen"
```
