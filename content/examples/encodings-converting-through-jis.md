---
title: "encodings/converting_through_jis.rb"
slug: encodings-converting-through-jis
description: "The metorex example program encodings/converting_through_jis.rb and its output."
---

`tests/_examples/encodings/converting_through_jis.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/converting_through_jis.rb){target=_blank rel=noopener}.

```metorex
# A converter carries text through each step of its convpath. Text reaches
# ISO-2022-JP through EUC-JP and the stateless form, which writes the escapes
# that switch sets. A piece that stops part-way through a character
# or an escape is held until the next piece arrives.

def show
  p(yield)
rescue EncodingError => trouble
  p([trouble.class, trouble.message])
end

p(Encoding::Converter.search_convpath("UTF-8", "ISO-2022-JP").map { |step| step.map(&:name) })
p(Encoding::Converter.search_convpath("Shift_JIS", "EUC-JP").map { |step| step.map(&:name) })

writing = Encoding::Converter.new("UTF-8", "ISO-2022-JP")
p(writing.convert("あ"))
p(writing.convert("a"))
p(writing.convert("い"))
p(writing.finish)

reading = Encoding::Converter.new("ISO-2022-JP", "UTF-8")
p(reading.convert("\e$".force_encoding("ISO-2022-JP")))
p(reading.convert("B$".force_encoding("ISO-2022-JP")))
p(reading.convert("\"\e(Bz".force_encoding("ISO-2022-JP")))
p(reading.finish)

cut_short = Encoding::Converter.new("ISO-2022-JP", "UTF-8")
p(cut_short.convert("\e$B$".force_encoding("ISO-2022-JP")))
show { cut_short.finish }
show { Encoding::Converter.new("ISO-2022-JP", "UTF-8").convert("\e$B\xA4".force_encoding("ISO-2022-JP")) }
show { Encoding::Converter.new("UTF-8", "ISO-2022-JP").convert("é") }
show { Encoding::Converter.new("UTF-8", "ISO-2022-JP").convert("€") }
show { Encoding::Converter.new("Shift_JIS", "ISO-8859-1").convert("\x82\xA0".force_encoding("Shift_JIS")) }

replacing = Encoding::Converter.new("UTF-8", "ISO-2022-JP", undef: :replace)
p(replacing.convert("あé"))
p(replacing.finish)

wide = Encoding::Converter.new("UTF-8", "UTF-16BE")
p(wide.convert("\xE3".b.force_encoding("UTF-8")).bytes)
p(wide.convert("\x81\x82".b.force_encoding("UTF-8")).bytes)

lines = Encoding::Converter.new("UTF-8", "UTF-16LE", universal_newline: true)
p(lines.convpath)
p(lines.convert("a\r").bytes)
p(lines.convert("\nb\r").bytes)
p(lines.finish.bytes)

p(Encoding::Converter.new("Shift_JIS", "EUC-JP").convert("\x82\xA0".force_encoding("Shift_JIS")).bytes)
p("\e$B$\"\e(B".force_encoding("ISO-2022-JP").encode("UTF-8"))
p(Encoding.find("stateless-ISO-2022-JP").dummy?)
```

Output:

```
[["UTF-8", "EUC-JP"], ["EUC-JP", "stateless-ISO-2022-JP"], ["stateless-ISO-2022-JP", "ISO-2022-JP"]]
[["Shift_JIS", "EUC-JP"]]
"\e\x24\x42\x24\x22"
"\e\x28\x42\x61"
"\e\x24\x42\x24\x24"
"\e\x28\x42"
""
""
"あz"
""
""
[Encoding::InvalidByteSequenceError, "incomplete \"$\" on ISO-2022-JP"]
[Encoding::InvalidByteSequenceError, "\"\\xA4\" on ISO-2022-JP"]
[Encoding::UndefinedConversionError, "\"\\x8F\\xAB\\xB1\" to stateless-ISO-2022-JP in conversion from UTF-8 to EUC-JP to stateless-ISO-2022-JP to ISO-2022-JP"]
[Encoding::UndefinedConversionError, "U+20AC to EUC-JP in conversion from UTF-8 to EUC-JP to stateless-ISO-2022-JP to ISO-2022-JP"]
[Encoding::UndefinedConversionError, "U+3042 to ISO-8859-1 in conversion from Shift_JIS to UTF-8 to ISO-8859-1"]
"\e\x24\x42\x24\x22\e\x28\x42\x3F"
""
[]
[48, 66]
["universal_newline", [#<Encoding:UTF-8>, #<Encoding:UTF-16LE>]]
[97, 0]
[10, 0, 98, 0]
[10, 0]
[164, 162]
"あ"
false
```
