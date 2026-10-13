---
title: "cli_flags/source_encoding.rb"
slug: cli-flags-source-encoding
description: "The metorex example program cli_flags/source_encoding.rb and its output."
---

`tests/_examples/cli_flags/source_encoding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/source_encoding.rb){target=_blank rel=noopener}.

```metorex
# Under `-K`, the literals of a script with no magic comment are in the
# encoding the flag names, and so is __ENCODING__.
p "a".encoding
p __ENCODING__
```
