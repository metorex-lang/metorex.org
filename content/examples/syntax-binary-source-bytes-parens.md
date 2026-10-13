---
title: "syntax/binary_source/bytes_parens.rb"
slug: syntax-binary-source-bytes-parens
description: "The metorex example program syntax/binary_source/bytes_parens.rb and its output."
---

`tests/_examples/syntax/binary_source/bytes_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/binary_source/bytes_parens.rb).

```metorex
# encoding: binary
# A source written in bytes keeps each numeric escape as its own byte rather
# than spelling a character out of a run of them.
p("\343\203\255".length)
p("\xE3\x83\xAD".length)
p(%[\xE3\x83\xAD].length)
```

Output:

```
3
3
3
```
