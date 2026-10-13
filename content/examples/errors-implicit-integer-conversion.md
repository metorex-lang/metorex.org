---
title: "errors/implicit_integer_conversion.rb"
slug: errors-implicit-integer-conversion
description: "The metorex example program errors/implicit_integer_conversion.rb and its output."
---

`tests/_examples/errors/implicit_integer_conversion.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/implicit_integer_conversion.rb).

```metorex
# A value that cannot stand in for an Integer is refused with a TypeError
# naming it: nil, true and false by name, and anything else by its class.
[nil, true, false, Object.new, "12"].each do |value|
  begin
    Integer.sqrt(value)
  rescue TypeError => error
    puts error.message
  end
end
```

Output:

```
no implicit conversion from nil to integer
no implicit conversion of true into Integer
no implicit conversion of false into Integer
no implicit conversion of Object into Integer
no implicit conversion of String into Integer
```
