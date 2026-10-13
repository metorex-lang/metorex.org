---
title: "strings/getbyte_positions.rb"
slug: strings-getbyte-positions
description: "The metorex example program strings/getbyte_positions.rb and its output."
---

`tests/_examples/strings/getbyte_positions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/getbyte_positions.rb){target=_blank rel=noopener}.

```metorex
plain = "rate"
p([plain.getbyte(0), plain.getbyte(-1), plain.getbyte(4), plain.getbyte(-5)])

accented = "café"
p([accented.getbyte(3), accented.getbyte(4), accented.getbyte(-1), accented.getbyte(5)])

packed = [7, 200, 255].pack("C*")
p([packed.getbyte(0), packed.getbyte(1), packed.getbyte(-1), packed.getbyte(-4), packed.getbyte(3)])

wide = "a€".encode("UTF-16LE")
p([wide.getbyte(0), wide.getbyte(2), wide.getbyte(-1), wide.getbyte(4)])

binary = "é".b
p([binary.getbyte(0), binary.getbyte(1), binary.getbyte(-2)])

require("stringio")
stream = StringIO.new([1, 0, 200, 9].pack("C*"))
p([stream.getbyte, stream.getbyte, stream.pos])
stream.pos -= 1
p([stream.getbyte, stream.read(1).bytes, stream.pos, stream.getbyte])

text = StringIO.new("añb")
text.pos = 3
p([text.pos, text.getc])
```

Output:

```
[114, 101, nil, nil]
[195, 169, 169, nil]
[7, 200, 255, nil, nil]
[97, 172, 32, nil]
[195, 169, 195]
[1, 0, 2]
[0, [200], 3, 9]
[3, "b"]
```
