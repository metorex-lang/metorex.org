---
title: "scanning/buffered_stream/reading_parens.rb"
slug: scanning-buffered-stream-reading-parens
description: "The metorex example program scanning/buffered_stream/reading_parens.rb and its output."
---

`tests/_examples/scanning/buffered_stream/reading_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/scanning/buffered_stream/reading_parens.rb){target=_blank rel=noopener}.

```metorex
require "stringio"

# A buffer handed to `read` is filled with what was read and answered in its
# place, so the caller keeps the one string it passed.
stream = StringIO.new("this is\nan example\n")
buffer = +""
p(stream.read(4, buffer).equal?(buffer))
p(buffer)

stream.rewind
p(stream.gets)
p($_)
p(stream.gets(chomp: true))

stream.rewind
p(stream.readlines(" "))
stream.rewind
p(stream.each_line.to_a)

# Truncating cuts the buffer itself.
text = +"123456789"
held = StringIO.new text
held.truncate(4)
p(text)

# A stream reports the encoding its buffer carries.
tagged = StringIO.new(+"abc")
tagged.set_encoding(Encoding::US_ASCII)
p(tagged.external_encoding)
p(tagged.string.encoding)
```

Output:

```
true
"this"
"this is\n"
"this is\n"
"an example"
["this ", "is\nan ", "example\n"]
["this is\n", "an example\n"]
"1234"
#<Encoding:US-ASCII>
#<Encoding:US-ASCII>
```
