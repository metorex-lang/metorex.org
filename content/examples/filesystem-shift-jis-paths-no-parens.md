---
title: "filesystem/shift_jis_paths_no_parens.rb"
slug: filesystem-shift-jis-paths-no-parens
description: "The metorex example program filesystem/shift_jis_paths_no_parens.rb and its output."
---

`tests/_examples/filesystem/shift_jis_paths_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/shift_jis_paths_no_parens.rb).

```metorex
require "tmpdir"

# On macOS a path in another ASCII-compatible encoding reaches the system as
# the characters it spells, so a name written in Windows-31J finds the file
# written under the same name in UTF-8.
Dir.mktmpdir do |directory|
  named = File.join directory, "rates_あ.txt"
  File.write named, "12"
  shift_jis = named.encode Encoding::Windows_31J
  p File.exist? shift_jis
  p File.size shift_jis
  p File.read shift_jis
  moved = File.join(directory, "moved_あ.txt").encode Encoding::Windows_31J
  File.rename shift_jis, moved
  p File.file? named
  resolved = File.realpath moved
  p File.basename(resolved).encoding
end
```

Output:

```
true
2
"12"
false
#<Encoding:Windows-31J>
```
