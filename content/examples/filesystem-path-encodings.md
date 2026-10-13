---
title: "filesystem/path_encodings.rb"
slug: filesystem-path-encodings
description: "The metorex example program filesystem/path_encodings.rb and its output."
---

`tests/_examples/filesystem/path_encodings.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/path_encodings.rb).

```metorex
require "tmpdir"

# The pieces of a path, and the paths the system answers for one, are
# written in the encoding the path was given in.
path = "/ledgers/2024/summary.txt".encode(Encoding::EUC_JP)
p File.extname(path).encoding
p File.split(path).map(&:encoding)
Dir.mktmpdir do |directory|
  File.write(File.join(directory, "rates.txt"), "1")
  named = File.join(directory, "rates.txt").encode(Encoding::EUC_JP)
  p File.realpath(named).encoding
  p Dir.glob(File.join(directory, "*.txt").encode(Encoding::EUC_JP)).map(&:encoding)
  # A path that cannot be written in the encoding asked for keeps its bytes,
  # labeled with that encoding, for `realpath`, and keeps its own encoding
  # for `realdirpath`.
  inner = File.join(directory, "rates_あ")
  Dir.mkdir(inner)
  p File.realpath(".".encode(Encoding::ISO_8859_1), inner).encoding
  p File.realdirpath(".".encode(Encoding::ISO_8859_1), inner).encoding
end

# A positional flag beside a `flags:` keyword is not read.
p Dir.glob("*.none", :ignored, flags: File::FNM_DOTMATCH)
begin
  Dir.glob("*.none", :ignored)
rescue TypeError => problem
  p problem.message
end
```

Output:

```
#<Encoding:EUC-JP>
[#<Encoding:EUC-JP>, #<Encoding:EUC-JP>]
#<Encoding:EUC-JP>
[#<Encoding:EUC-JP>]
#<Encoding:ISO-8859-1>
#<Encoding:UTF-8>
[]
"no implicit conversion of Symbol into Integer"
```
