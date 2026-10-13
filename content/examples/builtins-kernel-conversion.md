---
title: "builtins/kernel_conversion.rb"
slug: builtins-kernel-conversion
description: "The metorex example program builtins/kernel_conversion.rb and its output."
---

`tests/_examples/builtins/kernel_conversion.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/kernel_conversion.rb){target=_blank rel=noopener}.

```metorex
puts(Integer("42"))
puts(Integer(3.9))
puts(String(42))
puts(String(nil))
puts(Array(nil))
puts(Array([1, 2]))
puts(Array("hi"))

begin
  Integer(true)
rescue TypeError => e
  puts(e.message)
end

begin
  Integer(nil)
rescue TypeError => e
  puts(e.message)
end
```

Output:

```
42
3
42

1
2
hi
can't convert TrueClass into Integer
can't convert nil into Integer
```
