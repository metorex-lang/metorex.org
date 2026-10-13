---
title: "errors/begin_else_ensure_parens.rb"
slug: errors-begin-else-ensure-parens
description: "The metorex example program errors/begin_else_ensure_parens.rb and its output."
---

`tests/_examples/errors/begin_else_ensure_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/begin_else_ensure_parens.rb).

```metorex
begin
  puts "try block"
  x = 42
rescue => e
  puts "error: " + e.to_s
else
  puts "no error, x = " + x.to_s
ensure
  puts "ensure ran"
end
```

Output:

```
try block
no error, x = 42
ensure ran
```
