---
title: "functions/parenless_symbol_args.rb"
slug: functions-parenless-symbol-args
description: "The metorex example program functions/parenless_symbol_args.rb and its output."
---

`tests/_examples/functions/parenless_symbol_args.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/parenless_symbol_args.rb).

```metorex
class Registry
  def self.register(event, handler)
    puts event.to_s
    puts handler
  end
end

Registry.register :start, "handler_one"
Registry.register :finish, "handler_two"
```

Output:

```
start
handler_one
finish
handler_two
```
