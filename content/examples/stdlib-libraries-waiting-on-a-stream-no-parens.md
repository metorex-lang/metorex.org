---
title: "stdlib_libraries/waiting_on_a_stream_no_parens.rb"
slug: stdlib-libraries-waiting-on-a-stream-no-parens
description: "The metorex example program stdlib_libraries/waiting_on_a_stream_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/waiting_on_a_stream_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/waiting_on_a_stream_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The same as `waiting_on_a_stream.rb`, written without parentheses.
# `expect` reads a stream until what has arrived matches a pattern, answering
# the match and whatever it captured.
require 'expect'

reading, writing = IO.pipe
writing << 'prompt> hello'
p reading.expect('prompt>')

writing << 'ready> again'
p reading.expect(/(rea)dy(>)/)

writing << 'part'
writing.close
p reading.expect('partial')
reading.close

# A gzip reader tags what it reads with the encoding it was told to read in.
require 'zlib'
require 'stringio'

held = StringIO.new Zlib.gzip('some text')
p Zlib::GzipReader.new(held, external_encoding: 'UTF-8').read.encoding
held.rewind
p Zlib::GzipReader.new(held, external_encoding: 'UTF-16LE').read.encoding
```

Output:

```
["prompt>"]
[" helloready>", "rea", ">"]
nil
#<Encoding:UTF-8>
#<Encoding:UTF-16LE>
```
