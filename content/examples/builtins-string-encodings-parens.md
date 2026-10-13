---
title: "builtins/string_encodings_parens.rb"
slug: builtins-string-encodings-parens
description: "The metorex example program builtins/string_encodings_parens.rb and its output."
---

`tests/_examples/builtins/string_encodings_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/string_encodings_parens.rb){target=_blank rel=noopener}.

```metorex
# A string carries the encoding it says it is in, and two strings holding the
# same text are still two strings.
require "base64"
require "securerandom"

p("hello".encoding)
held = "hello"
held.force_encoding("EUC-JP")
p(held.encoding)
p(held[0, 3].encoding)
p(held.upcase.encoding)
p("plain"[0, 3].encoding)

p("hello".b.encoding)
p("hello".b == "hello")
p([65, 66].pack("C*").encoding)
p([].pack("").encoding)
p("abc".encode("US-ASCII").encoding)
p(Encoding::BINARY.equal?(Encoding::ASCII_8BIT))

# Identity, which the encoding tag rides along with.
first = "same"
second = "same"
p(first == second)
p(first.equal?(second))
p(first.equal?(first))
p(first.object_id == second.object_id)
p(first.object_id == first.object_id)

# The values that write themselves as one unchanging string.
p(nil.to_s.equal?(nil.to_s))
p(true.to_s.equal?(true.to_s))
p(false.to_s.equal?(false.to_s))
p(:held.name.equal?(:held.name))
module Named; end
p(Named.name.equal?(Named.name))
p(Named.name)

# A string cut from a match carries the subject's encoding.
subject = "one two"
subject.force_encoding("EUC-JP")
found = subject.match(/two/)
p(found.pre_match.encoding)

p(Base64.encode64("hi").encoding)
p(Base64.decode64("aGk=").encoding)
p(SecureRandom.bytes(4).encoding)
p(Time.utc(2001, 1, 1).to_s.encoding)
```

Output:

```
#<Encoding:UTF-8>
#<Encoding:EUC-JP>
#<Encoding:EUC-JP>
#<Encoding:EUC-JP>
#<Encoding:UTF-8>
#<Encoding:BINARY (ASCII-8BIT)>
true
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:US-ASCII>
#<Encoding:US-ASCII>
true
true
false
true
false
true
true
true
true
true
true
"Named"
#<Encoding:EUC-JP>
#<Encoding:US-ASCII>
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:US-ASCII>
```
