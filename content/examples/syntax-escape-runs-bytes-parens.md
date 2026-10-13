---
title: "syntax/escape_runs/bytes_parens.rb"
slug: syntax-escape-runs-bytes-parens
description: "The metorex example program syntax/escape_runs/bytes_parens.rb and its output."
---

`tests/_examples/syntax/escape_runs/bytes_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/escape_runs/bytes_parens.rb).

```metorex
# A run of numeric escapes names bytes, and bytes that spell a character in
# UTF-8 read back as that character.
p("\343\203\255")
p("\xE3\x83\xAD")
p("\343\203\255".bytes)
p("\000".bytes)
p("a\101b")

# A percent literal reads the same escapes a quoted string does.
p(%[<\xA4??>].length)
p(%(tab\there))
p(%{\343\203\255})
p(%(\e[1m).bytes)
```

Output:

```
"ロ"
"ロ"
[227, 131, 173]
[0]
"aAb"
5
"tab\there"
"ロ"
[27, 91, 49, 109]
```
