---
title: "encodings/encoding_fallbacks.rb"
slug: encodings-encoding-fallbacks
description: "The metorex example program encodings/encoding_fallbacks.rb and its output."
---

`tests/_examples/encodings/encoding_fallbacks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/encoding_fallbacks.rb){target=_blank rel=noopener}.

```metorex
# `fallback:` is asked what to write for each character the destination
# cannot spell. A Hash is looked up, default included, and a Proc, a lambda,
# a Method or anything else answering `[]` is handed the character.
text = "B�"
p text.encode Encoding::US_ASCII, fallback: { "�" => "bar" }

defaulted = {}
defaulted.default = "dflt"
p text.encode Encoding::US_ASCII, fallback: defaulted

p text.encode Encoding::US_ASCII, fallback: proc { |character| character.bytes.inspect }
p text.encode Encoding::US_ASCII, fallback: ->(character) { character.ord.to_s 16 }

def spelled_out(character) = "U+#{character.ord.to_s(16).upcase}"
p text.encode Encoding::US_ASCII, fallback: method(:spelled_out)

class Lookup
  def [](character) = "lookup"
end
p text.encode Encoding::US_ASCII, fallback: Lookup.new

# An answer that is not a String is read through `to_str`.
class Word
  def to_str = "word"
end
p text.encode Encoding::US_ASCII, fallback: { "�" => Word.new }

# `undef: :replace` is used ahead of a fallback.
p text.encode Encoding::US_ASCII, undef: :replace, replace: "foo", fallback: proc { "bar" }

# A character nothing answers for is refused as undefined, and an answer the
# destination cannot spell either is refused as too big.
def refusal
  yield
rescue StandardError => problem
  [problem.class, problem.message]
end

p refusal { text.encode Encoding::US_ASCII, fallback: { "foo" => "bar" } }
p refusal { text.encode Encoding::US_ASCII, fallback: Object.new }
p refusal { text.encode Encoding::US_ASCII, fallback: { "�" => Object.new } }
p refusal { text.encode Encoding::US_ASCII, fallback: { "�" => "￮" } }
```

Output:

```
"Bbar"
"Bdflt"
"B[239, 191, 189]"
"Bfffd"
"BU+FFFD"
"Blookup"
"Bword"
"Bfoo"
[Encoding::UndefinedConversionError, "U+FFFD from UTF-8 to US-ASCII"]
[Encoding::UndefinedConversionError, "U+FFFD from UTF-8 to US-ASCII"]
[TypeError, "no implicit conversion of Object into String"]
[ArgumentError, "too big fallback string"]
```
