---
title: "errors/handled_then_outer_parens.rb"
slug: errors-handled-then-outer-parens
description: "The metorex example program errors/handled_then_outer_parens.rb and its output."
---

`tests/_examples/errors/handled_then_outer_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/handled_then_outer_parens.rb){target=_blank rel=noopener}.

```metorex
# `$!` names the exception being handled. A rescue clause inside a handler
# leaves the outer exception in place once it is done, so the handler that
# follows still names what it is handling.
begin
  raise("outer")
rescue RuntimeError
  p($!.message)
  begin
    raise(ArgumentError, "inner")
  rescue ArgumentError
    p($!.message)
  end
  p($!.message)
  p($!.class)
end
p($!)

# A rescue in a method called from a handler leaves the same thing standing.
def swallowing
  Integer("not a number")
rescue ArgumentError
  :swallowed
end

begin
  raise("again")
rescue RuntimeError
  p(swallowing)
  p($!.message)
end
```

Output:

```
"outer"
"inner"
"outer"
RuntimeError
nil
:swallowed
"again"
```
