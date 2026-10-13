---
title: "filesystem/descriptor_streams.rb"
slug: filesystem-descriptor-streams
description: "The metorex example program filesystem/descriptor_streams.rb and its output."
---

`tests/_examples/filesystem/descriptor_streams.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/descriptor_streams.rb){target=_blank rel=noopener}.

```metorex
# A stream may be built over a descriptor rather than a name: `IO.sysopen`
# opens one and hands back its number, and `IO.new` stands over it. The mode
# and the options say how the stream is used and what encodings it carries.
require "tmpdir"

path = File.join Dir.tmpdir, "metorex_descriptor_streams.txt"
other = File.join Dir.tmpdir, "metorex_descriptor_streams_copy.txt"

number = IO.sysopen path, "w"
p number.is_a? Integer
stream = IO.new number, "w"
p stream.write "one\ntwo\nthree\n"
p stream.external_encoding
stream.close

# The mode may be named as an option, and the encodings alongside it.
stream = IO.new IO.sysopen(path, "r"), "r:utf-8:iso-8859-1"
p [stream.external_encoding.to_s, stream.internal_encoding.to_s]
stream.close

# With a block the stream is handed over and closed afterwards.
held = IO.open IO.sysopen(path, "r"), "r" do |reading|
  reading.gets
end
p held

# Where a stream stands, and how far it reaches.
stream = File.open path, "r+"
p stream.size
p stream.gets
p stream.pos
stream.seek 0, IO::SEEK_SET
p stream.pos
stream.seek(-6, IO::SEEK_END)
p stream.read
stream.rewind
p stream.lineno
stream.close

# Everything one stream holds, written to another.
p IO.copy_stream(path, other)
p IO.read(other, 3)
p IO.read(other, 3, 4)
p IO.binread(other, 5, 8)

collected = []
IO.foreach other do |line|
  collected << line.chomp
end
p collected
p IO.readlines(other, chomp: true)

# A file cut down to the count of bytes it is told to keep.
stream = File.open other, "r+"
stream.truncate 3
p stream.size
stream.close
p File.read other

File.delete path
File.delete other
```

Output:

```
true
14
nil
["UTF-8", "ISO-8859-1"]
"one\n"
14
"one\n"
4
0
"three\n"
0
14
"one"
"two"
"three"
["one", "two", "three"]
["one", "two", "three"]
3
"one"
```
