---
title: "encodings/conversion_error_details.rb"
slug: encodings-conversion-error-details
description: "The metorex example program encodings/conversion_error_details.rb and its output."
---

`tests/_examples/encodings/conversion_error_details.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/conversion_error_details.rb){target=_blank rel=noopener}.

```metorex
# The error String#encode raises names the step of the conversion it
# stopped at and carries what MRI's does: the encodings of that step, and
# the character it could not spell or the bytes it could not read, with
# whether the input ended inside a character.
def show(label)
  yield
  puts "#{label}: no error"
rescue EncodingError => e
  attrs = %i[source_encoding_name destination_encoding_name error_char error_bytes readagain_bytes incomplete_input?].filter_map do |name|
    "#{name}=#{e.public_send(name).inspect}" if e.respond_to?(name)
  end
  puts "#{label}: #{e.class}: #{e.message} [#{attrs.join(", ")}]"
end
show("sjis ff") { "\xff".force_encoding("Shift_JIS").encode("UTF-8") }
show("sjis followed") { "\x82\x20".force_encoding("Shift_JIS").encode("UTF-8") }
show("sjis 80") { "a\x80b".force_encoding("Shift_JIS").encode("UTF-8") }
show("euc ff") { "\xff".force_encoding("EUC-JP").encode("UTF-8") }
show("euc followed") { "\xa4\x41".force_encoding("EUC-JP").encode("UTF-8") }
show("euc ss3 short") { "\x8f\xa1".force_encoding("EUC-JP").encode("UTF-8") }
show("euc ss2 bad") { "\x8e\x41".force_encoding("EUC-JP").encode("UTF-8") }
show("utf16 to latin1") { "あ".encode("UTF-16LE").encode("ISO-8859-1") }
show("utf8 to sjis") { "\u{1F600}".encode("Shift_JIS") }
show("utf8 followed") { "\xe3\x41".force_encoding("UTF-8").encode("UTF-16LE") }
show("binary to latin1") { "\xff".b.encode("ISO-8859-1") }
show("sjis to eucjp") { "\x82\xa0".force_encoding("Shift_JIS").encode("EUC-JP") }
show("utf8 to iso2022") { "\u{1F600}".encode("ISO-2022-JP") }
show("sjis to latin1") { "\x82\xA0".force_encoding("Shift_JIS").encode("ISO-8859-1") }
show("invalid utf8") { "\xff".force_encoding("UTF-8").encode("UTF-16LE") }
show("incomplete utf8") { "\xe3\x81".force_encoding("UTF-8").encode("UTF-16LE") }
show("incomplete sjis") { "\x82".force_encoding("Shift_JIS").encode("UTF-8") }
show("incomplete eucjp") { "\xa4\xa2\x8e".force_encoding("EUC-JP").encode("Shift_JIS") }
show("binary to utf8") { "\xff".b.encode("UTF-8") }
show("latin1 to ascii") { "\xff".force_encoding("ISO-8859-1").encode("US-ASCII") }
```

Output:

```
sjis ff: Encoding::InvalidByteSequenceError: "\xFF" on Shift_JIS [source_encoding_name="Shift_JIS", destination_encoding_name="UTF-8", error_bytes="\xFF", readagain_bytes=nil, incomplete_input?=false]
sjis followed: Encoding::InvalidByteSequenceError: "\x82" followed by " " on Shift_JIS [source_encoding_name="Shift_JIS", destination_encoding_name="UTF-8", error_bytes="\x82", readagain_bytes=" ", incomplete_input?=false]
sjis 80: Encoding::InvalidByteSequenceError: "\x80" on Shift_JIS [source_encoding_name="Shift_JIS", destination_encoding_name="UTF-8", error_bytes="\x80", readagain_bytes=nil, incomplete_input?=false]
euc ff: Encoding::InvalidByteSequenceError: "\xFF" on EUC-JP [source_encoding_name="EUC-JP", destination_encoding_name="UTF-8", error_bytes="\xFF", readagain_bytes=nil, incomplete_input?=false]
euc followed: Encoding::InvalidByteSequenceError: "\xA4" followed by "A" on EUC-JP [source_encoding_name="EUC-JP", destination_encoding_name="UTF-8", error_bytes="\xA4", readagain_bytes="A", incomplete_input?=false]
euc ss3 short: Encoding::InvalidByteSequenceError: incomplete "\x8F\xA1" on EUC-JP [source_encoding_name="EUC-JP", destination_encoding_name="UTF-8", error_bytes="\x8F\xA1", readagain_bytes=nil, incomplete_input?=true]
euc ss2 bad: Encoding::InvalidByteSequenceError: "\x8E" followed by "A" on EUC-JP [source_encoding_name="EUC-JP", destination_encoding_name="UTF-8", error_bytes="\x8E", readagain_bytes="A", incomplete_input?=false]
utf16 to latin1: Encoding::UndefinedConversionError: U+3042 to ISO-8859-1 in conversion from UTF-16LE to UTF-8 to ISO-8859-1 [source_encoding_name="UTF-8", destination_encoding_name="ISO-8859-1", error_char="あ"]
utf8 to sjis: Encoding::UndefinedConversionError: U+1F600 from UTF-8 to Shift_JIS [source_encoding_name="UTF-8", destination_encoding_name="Shift_JIS", error_char="😀"]
utf8 followed: Encoding::InvalidByteSequenceError: "\xE3" followed by "A" on UTF-8 [source_encoding_name="UTF-8", destination_encoding_name="UTF-16LE", error_bytes="\xE3", readagain_bytes="A", incomplete_input?=false]
binary to latin1: Encoding::UndefinedConversionError: "\xFF" to UTF-8 in conversion from ASCII-8BIT to UTF-8 to ISO-8859-1 [source_encoding_name="ASCII-8BIT", destination_encoding_name="UTF-8", error_char="\xFF"]
sjis to eucjp: no error
utf8 to iso2022: Encoding::UndefinedConversionError: U+1F600 to EUC-JP in conversion from UTF-8 to EUC-JP to stateless-ISO-2022-JP to ISO-2022-JP [source_encoding_name="UTF-8", destination_encoding_name="EUC-JP", error_char="😀"]
sjis to latin1: Encoding::UndefinedConversionError: U+3042 to ISO-8859-1 in conversion from Shift_JIS to UTF-8 to ISO-8859-1 [source_encoding_name="UTF-8", destination_encoding_name="ISO-8859-1", error_char="あ"]
invalid utf8: Encoding::InvalidByteSequenceError: "\xFF" on UTF-8 [source_encoding_name="UTF-8", destination_encoding_name="UTF-16LE", error_bytes="\xFF", readagain_bytes=nil, incomplete_input?=false]
incomplete utf8: Encoding::InvalidByteSequenceError: incomplete "\xE3\x81" on UTF-8 [source_encoding_name="UTF-8", destination_encoding_name="UTF-16LE", error_bytes="\xE3\x81", readagain_bytes=nil, incomplete_input?=true]
incomplete sjis: Encoding::InvalidByteSequenceError: incomplete "\x82" on Shift_JIS [source_encoding_name="Shift_JIS", destination_encoding_name="UTF-8", error_bytes="\x82", readagain_bytes=nil, incomplete_input?=true]
incomplete eucjp: Encoding::InvalidByteSequenceError: incomplete "\x8E" on EUC-JP [source_encoding_name="EUC-JP", destination_encoding_name="Shift_JIS", error_bytes="\x8E", readagain_bytes=nil, incomplete_input?=true]
binary to utf8: Encoding::UndefinedConversionError: "\xFF" from ASCII-8BIT to UTF-8 [source_encoding_name="ASCII-8BIT", destination_encoding_name="UTF-8", error_char="\xFF"]
latin1 to ascii: Encoding::UndefinedConversionError: U+00FF to US-ASCII in conversion from ISO-8859-1 to UTF-8 to US-ASCII [source_encoding_name="UTF-8", destination_encoding_name="US-ASCII", error_char="ÿ"]
```
