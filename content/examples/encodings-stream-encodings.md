---
title: "encodings/stream_encodings.rb"
slug: encodings-stream-encodings
description: "The metorex example program encodings/stream_encodings.rb and its output."
---

`tests/_examples/encodings/stream_encodings.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/stream_encodings.rb).

```metorex
# A stream told which encoding it reads in hands back whole characters of that
# encoding, and one told an internal encoding as well carries them over.
name = "/tmp/mx_stream_encodings_plain.txt"
File.write(name, "あい".encode("EUC-JP"), mode: "wb")

File.open(name, "r:euc-jp") do |stream|
  letter = stream.readchar
  p letter.encoding
  p letter.bytes
end

File.open(name, "r:euc-jp:utf-8") do |stream|
  letter = stream.readchar
  p letter
  p letter.encoding
end

File.open(name, mode: "r:euc-jp:utf-8") do |stream|
  p stream.readchar
end

# A byte the encoding cannot read is written as what the options name.
File.write(name, "a\xFFb", mode: "wb")
File.open(name) do |stream|
  stream.set_encoding(Encoding::EUC_JP, Encoding::UTF_8, invalid: :replace, replace: ".")
  p stream.read
end
File.delete(name)
```

Output:

```
#<Encoding:EUC-JP>
[164, 162]
"あ"
#<Encoding:UTF-8>
"あ"
"a.b"
```
