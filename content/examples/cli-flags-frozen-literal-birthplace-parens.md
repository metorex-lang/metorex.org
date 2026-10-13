---
title: "cli_flags/frozen_literal_birthplace_parens.rb"
slug: cli-flags-frozen-literal-birthplace-parens
description: "The metorex example program cli_flags/frozen_literal_birthplace_parens.rb and its output."
---

`tests/_examples/cli_flags/frozen_literal_birthplace_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/frozen_literal_birthplace_parens.rb){target=_blank rel=noopener}.

```metorex
# Under --debug-frozen-string-literal a string literal remembers where it was
# written, and the refusal to change it names that place.
held = 'written here'
begin
  held.<<(' and more')
rescue FrozenError => refused
  puts(refused.message)
end
```
