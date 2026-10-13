---
title: "builtins/argf_stream.rb"
slug: builtins-argf-stream
description: "The metorex example program builtins/argf_stream.rb and its output."
---

`tests/_examples/builtins/argf_stream.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/argf_stream.rb){target=_blank rel=noopener}.

```metorex
# ARGF reads a list of files as though they were one.
one = "/tmp/metorex_argf_plain_one.txt"
two = "/tmp/metorex_argf_plain_two.txt"
File.write one, "alpha\nbeta\n"
File.write two, "gamma\ndelta\n"

stream = ARGF.class.new one, two
p stream.to_s
p stream.file.path == one
p stream.argv
p stream.gets
p stream.lineno
p stream.eof?
p stream.gets
p stream.eof?
p stream.gets
p stream.file.path == two
p stream.readlines
# The last file has been read to the end, so the stream is closed and refuses
# to say whether it is at one.
begin
  stream.eof?
rescue IOError => problem
  p problem.message
end

reader = ARGF.class.new one
p reader.read(2)
p reader.pos
reader.rewind
p reader.pos
p reader.getc
p reader.read

File.delete one
File.delete two
```

Output:

```
"ARGF"
true
["/tmp/metorex_argf_plain_two.txt"]
"alpha\n"
1
false
"beta\n"
true
"gamma\n"
true
["delta\n"]
"closed stream"
"al"
2
0
"a"
"lpha\nbeta\n"
```
