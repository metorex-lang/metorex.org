---
title: "cli_flags/edit_in_place.rb"
slug: cli-flags-edit-in-place
description: "The metorex example program cli_flags/edit_in_place.rb and its output."
---

`tests/_examples/cli_flags/edit_in_place.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/edit_in_place.rb).

```metorex
# Every line read is written back over the file it came from, which is what
# `-i` asks for. The name of the file being read is reported as it is edited.
while (line = ARGF.gets)
  puts(line.chomp.upcase)
end
```
