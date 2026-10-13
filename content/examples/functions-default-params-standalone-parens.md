---
title: "functions/default_params_standalone_parens.rb"
slug: functions-default-params-standalone-parens
description: "The metorex example program functions/default_params_standalone_parens.rb and its output."
---

`tests/_examples/functions/default_params_standalone_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/default_params_standalone_parens.rb){target=_blank rel=noopener}.

```metorex
def say(msg, times = 1)
  i = 0
  while i < times
    puts msg
    i = i + 1
  end
end

say "once"
say "twice", 2
```

Output:

```
once
twice
twice
```
