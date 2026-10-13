---
title: "errors/raise_two_arg_parens.rb"
slug: errors-raise-two-arg-parens
description: "The metorex example program errors/raise_two_arg_parens.rb and its output."
---

`tests/_examples/errors/raise_two_arg_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/raise_two_arg_parens.rb).

```metorex
begin
  raise RuntimeError, "custom message"
rescue
  puts "caught two-arg raise"
end
```

Output:

```
caught two-arg raise
```
