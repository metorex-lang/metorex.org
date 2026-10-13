---
title: "errors/raised_position_no_parens.rb"
slug: errors-raised-position-no-parens
description: "The metorex example program errors/raised_position_no_parens.rb and its output."
---

`tests/_examples/errors/raised_position_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/raised_position_no_parens.rb).

```metorex
# An exception the interpreter raises carries the stack it was raised on,
# which `$@` reads for the one being handled.
held = (1 / 0 rescue $!)
p held.class
p held.backtrace.class
p((1 / 0 rescue $@).class)

# A namespaced error is placed by its ancestors, so `SystemCallError` catches
# the Errno classes under it.
begin
  File.read "/no/such/path/at/all"
rescue SystemCallError => problem
  p problem.class
end
```

Output:

```
ZeroDivisionError
Array
Array
Errno::ENOENT
```
