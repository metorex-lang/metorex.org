---
title: "cli_flags/switch_globals_parens.rb"
slug: cli-flags-switch-globals-parens
description: "The metorex example program cli_flags/switch_globals_parens.rb and its output."
---

`tests/_examples/cli_flags/switch_globals_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/switch_globals_parens.rb){target=_blank rel=noopener}.

```metorex
# Under `-s`, each switch written among the program's own arguments binds a
# global of the same name, with the dashes in it turned into underscores.
p($flag)
p($name)
p($_long__name)
p(ARGV)
```
