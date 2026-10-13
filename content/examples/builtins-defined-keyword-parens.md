---
title: "builtins/defined_keyword_parens.rb"
slug: builtins-defined-keyword-parens
description: "The metorex example program builtins/defined_keyword_parens.rb and its output."
---

`tests/_examples/builtins/defined_keyword_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/defined_keyword_parens.rb).

```metorex
# Local variable
x = 42
r = defined? x
puts r
r2 = defined? y
puts r2

# Method/function
def hello
  "hi"
end
r3 = defined? hello
puts r3

# Constant/class
r4 = defined? String
puts r4

# Literals
r5 = defined? 42
puts r5
```

Output:

```
local-variable

method
constant
expression
```
