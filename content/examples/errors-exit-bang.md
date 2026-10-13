---
title: "errors/exit_bang.rb"
slug: errors-exit-bang
description: "The metorex example program errors/exit_bang.rb and its output."
---

`tests/_examples/errors/exit_bang.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/exit_bang.rb){target=_blank rel=noopener}.

```metorex
begin
  puts "before exit!"
  exit! 9
rescue SystemExit
  puts "not rescuable"
ensure
  puts "ensure does not run"
end
```
