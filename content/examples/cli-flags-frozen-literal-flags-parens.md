---
title: "cli_flags/frozen_literal_flags_parens.rb"
slug: cli-flags-frozen-literal-flags-parens
description: "The metorex example program cli_flags/frozen_literal_flags_parens.rb and its output."
---

`tests/_examples/cli_flags/frozen_literal_flags_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/frozen_literal_flags_parens.rb){target=_blank rel=noopener}.

```metorex
# Every place writing the same literal shares one frozen string when the
# program was started with --enable-frozen-string-literal, and each place
# writes a mutable string of its own when it was started with the opposite.
held = "shared"
puts("frozen #{held.frozen?}")
puts("shared #{"shared".equal?("shared")}")
```
