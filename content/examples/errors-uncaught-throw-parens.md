---
title: "errors/uncaught_throw_parens.rb"
slug: errors-uncaught-throw-parens
description: "The metorex example program errors/uncaught_throw_parens.rb and its output."
---

`tests/_examples/errors/uncaught_throw_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/uncaught_throw_parens.rb).

```metorex
# `UncaughtThrowError#tag` and `#value` report the throw that found no catch.
begin
  throw(:abc)
rescue UncaughtThrowError => error
  p(error.tag)
  p(error.value)
  puts(error.message)
end

begin
  catch(:a) { throw(:b, "carried") }
rescue UncaughtThrowError => error
  p(error.tag)
  p(error.value)
end

# Both are nil on an UncaughtThrowError no throw raised.
p(UncaughtThrowError.new("uncaught throw :abc").tag)
p(UncaughtThrowError.new("uncaught throw :abc").value)

# Another exception answers neither.
p(RuntimeError.new("x").respond_to?(:tag))
```

Output:

```
:abc
nil
uncaught throw :abc
:b
"carried"
nil
nil
false
```
