---
title: "strings/stringio_ungetc_no_parens.rb"
slug: strings-stringio-ungetc-no-parens
description: "The metorex example program strings/stringio_ungetc_no_parens.rb and its output."
---

`tests/_examples/strings/stringio_ungetc_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/stringio_ungetc_no_parens.rb){target=_blank rel=noopener}.

```metorex
require "stringio"
require "strscan"

# Characters put back replace the bytes before the cursor, and what does not
# fit in front of it is added to the start.
io = StringIO.new +"1234"
io.ungetc "A"
p io.string
io = StringIO.new +"1234"
io.pos = 2
io.ungetc "φ"
p [io.pos, io.string]
io = StringIO.new +"1234"
io.pos = 2
io.ungetc "foo"
p [io.pos, io.string]

# A character read and put back is read again whole.
io = StringIO.new +"∂φ/"
letter = io.getc
io.ungetc letter
first = io.readpartial 3
p first.bytes.size
p io.read

# The rest a scanner has left is counted in bytes.
scanner = StringScanner.new "φx"
p scanner.rest_size
```

Output:

```
"A1234"
[0, "φ34"]
[0, "foo34"]
3
"φ/"
3
```
