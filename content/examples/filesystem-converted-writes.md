---
title: "filesystem/converted_writes.rb"
slug: filesystem-converted-writes
description: "The metorex example program filesystem/converted_writes.rb and its output."
---

`tests/_examples/filesystem/converted_writes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/converted_writes.rb){target=_blank rel=noopener}.

```metorex
# A stream told an encoding writes text carried into it, one piece at a
# time, while `syswrite` writes the bytes as they stand. A stream told none
# writes bytes, and nothing written asks nothing of the stream.
path = "/tmp/metorex_converted_writes_#{Process.pid}.txt"

File.open(path, "w", encoding: Encoding::UTF_32LE) { |file| p file.write("h", "i") }
p File.binread(path).bytes
File.open(path, "w", external_encoding: Encoding::UTF_16BE) { |file| file.syswrite "hi" }
p File.binread(path).bytes
File.open(path, "w") { |file| file.write "\x87".b, "ą" }
p File.binread(path).bytes
File.open(path, "r") { |file| p file.write("") }

def refusal
  yield
rescue StandardError => problem
  [problem.class, problem.message]
end

File.open path, "w", external_encoding: Encoding::UTF_16BE do |file|
  p refusal { file.write "été".b }
end

# `IO.write` passes its options to the open, or `open_args:` in their place,
# and answers how many bytes it wrote.
p IO.write(path, "hi", mode: "w", encoding: Encoding::UTF_32LE)
p IO.write(path, "hi", open_args: ["w", nil, {encoding: Encoding::UTF_32LE}])
p IO.write(path, "hi", 2, mode: "r", open_args: ["w"])
p File.read(path)
p refusal { IO.write path, "hi", open_args: [{encoding: Encoding::UTF_32LE}] }
p refusal { IO.write path, "hi", mode: "w:UTF-16BE", encoding: Encoding::UTF_32LE }

File.delete path
```

Output:

```
8
[104, 0, 0, 0, 105, 0, 0, 0]
[104, 105]
[135, 196, 133]
0
[Encoding::UndefinedConversionError, "\"\\xC3\" from ASCII-8BIT to UTF-8"]
8
8
2
"\u0000\u0000hi"
[ArgumentError, "ASCII incompatible encoding needs binmode"]
[ArgumentError, "encoding specified twice"]
```
