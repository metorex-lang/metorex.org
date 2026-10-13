---
title: "encodings/converter_stepwise.rb"
slug: encodings-converter-stepwise
description: "The metorex example program encodings/converter_stepwise.rb and its output."
---

`tests/_examples/encodings/converter_stepwise.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/converter_stepwise.rb).

```metorex
# A converter carries what it can through primitive_convert and reports how
# it stopped, leaving the rest in the source string.
converter = Encoding::Converter.new("utf-8", "iso-8859-1")
source = +"glark"
destination = +""
p(converter.primitive_convert(source, destination))
p(destination)
p(converter.primitive_errinfo)
p(converter.last_error)

converter = Encoding::Converter.new("utf-8", "iso-8859-1")
p(converter.primitive_convert(+"\u{9876}", +""))
p(converter.last_error.class)

# A character the text stops part-way through is held back until finish.
converter = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
p(converter.convert("abc"))
p(converter.primitive_convert(+"\xa4", +"", nil, 10))
p(converter.primitive_errinfo)

# A replacement stands in for what the destination cannot spell.
converter = Encoding::Converter.new("utf-8", "us-ascii", invalid: :replace, undef: :replace)
converter.replacement = "!"
written = +""
p(converter.primitive_convert(+"\u{4e2d}\u{6587}123", written))
p(written)

begin
  Encoding::Converter.new("utf-8", "us-ascii").replacement = "\u{4e2d}"
rescue Encoding::UndefinedConversionError => refused
  p(refused.class)
end
```

Output:

```
:finished
"glark"
[:finished, nil, nil, nil, nil]
nil
:undefined_conversion
Encoding::UndefinedConversionError
"abc"
:incomplete_input
[:incomplete_input, "EUC-JP", "UTF-8", "\xA4", ""]
:finished
"!!123"
Encoding::UndefinedConversionError
```
