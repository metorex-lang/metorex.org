---
title: "errors/uncaught_throw.rb"
slug: errors-uncaught-throw
description: "The metorex example program errors/uncaught_throw.rb and its output."
---

`tests/_examples/errors/uncaught_throw.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/uncaught_throw.rb).

```metorex
# `UncaughtThrowError#tag` and `#value` report the throw that found no catch.
begin
  throw :abc
rescue UncaughtThrowError => error
  p error.tag
  p error.value
  puts error.message
end

begin
  catch :a do
    throw :b, "carried"
  end
rescue UncaughtThrowError => error
  p error.tag
  p error.value
end

# Both are nil on an UncaughtThrowError no throw raised.
p UncaughtThrowError.new("uncaught throw :abc").tag
p UncaughtThrowError.new("uncaught throw :abc").value

# Another exception answers neither.
p RuntimeError.new("x").respond_to? :tag
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
