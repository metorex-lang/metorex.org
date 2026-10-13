---
title: "functions/parenless_symbol_bare_call_parens.rb"
slug: functions-parenless-symbol-bare-call-parens
description: "The metorex example program functions/parenless_symbol_bare_call_parens.rb and its output."
---

`tests/_examples/functions/parenless_symbol_bare_call_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/parenless_symbol_bare_call_parens.rb){target=_blank rel=noopener}.

```metorex
def register(event, handler)
  puts event.to_s
  puts handler
end

register(:start, "handler_one")
register(:finish, "handler_two")
```

Output:

```
start
handler_one
finish
handler_two
```
