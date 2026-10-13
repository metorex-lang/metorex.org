---
title: "cli_flags/edit_in_place_no_parens.rb"
slug: cli-flags-edit-in-place-no-parens
description: "The metorex example program cli_flags/edit_in_place_no_parens.rb and its output."
---

`tests/_examples/cli_flags/edit_in_place_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/edit_in_place_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Every line read is written back over the file it came from, which is what
# `-i` asks for. The name of the file being read is reported as it is edited.
while (line = ARGF.gets)
  puts line.chomp.upcase
end
```
