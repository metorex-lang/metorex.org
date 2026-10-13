---
title: "cli_flags/frozen_literal_birthplace.rb"
slug: cli-flags-frozen-literal-birthplace
description: "The metorex example program cli_flags/frozen_literal_birthplace.rb and its output."
---

`tests/_examples/cli_flags/frozen_literal_birthplace.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/frozen_literal_birthplace.rb).

```metorex
# Under --debug-frozen-string-literal a string literal remembers where it was
# written, and the refusal to change it names that place.
held = 'written here'
begin
  held << ' and more'
rescue FrozenError => refused
  puts refused.message
end
```
