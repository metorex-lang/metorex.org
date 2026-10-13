---
title: "builtins/byte_views/reading_parens.rb"
slug: builtins-byte-views-reading-parens
description: "The metorex example program builtins/byte_views/reading_parens.rb and its output."
---

`tests/_examples/builtins/byte_views/reading_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/byte_views/reading_parens.rb).

```metorex
require "stringio"
require "io/console"

# A stream counts its cursor in bytes, so a character made of several bytes
# moves it by that many.
stream = StringIO.new("föóbar")
stream.getch
p(stream.pos)
stream.getch
p(stream.pos)
stream.seek(3, IO::SEEK_END)
p(stream.pos)
p(stream.external_encoding)
stream.binmode
p(stream.external_encoding)
stream.set_encoding(Encoding::EUC_JP)
p(stream.external_encoding)

# `unpack` tags what it reads: text as bytes, bits and nibbles as ASCII.
p("abc".unpack("a*").first.encoding)
p("abc".unpack("B8").first.encoding)
p("abc".unpack("H2").first.encoding)
p([0xFF].pack("C").getbyte(0))

# A number written as a Rational has to read back as one.
class Whole
  def to_r
    1
  end
end
begin
  Rational(Whole.new)
rescue TypeError => problem
  p problem.message
end
```

Output:

```
1
3
11
#<Encoding:UTF-8>
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:EUC-JP>
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:US-ASCII>
#<Encoding:US-ASCII>
255
"can't convert Whole into Rational (Whole#to_r gives Integer)"
```
