---
title: "builtins/defined_keyword.rb"
slug: builtins-defined-keyword
description: "The metorex example program builtins/defined_keyword.rb and its output."
---

`tests/_examples/builtins/defined_keyword.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/defined_keyword.rb).

```metorex
# Local variable
x = 42
puts(defined?(x))
puts(defined?(y))

# Method/function
def hello
  "hi"
end
puts(defined?(hello))

# Constant/class
puts(defined?(String))
puts(defined?(NonexistentClass))

# Global variable
$foo = "bar"
puts(defined?($foo))
puts(defined?($nonexistent))

# Literals
puts(defined?(42))
puts(defined?("hello"))
puts(defined?(nil))
puts(defined?(true))

# Without parens on defined? itself
r = defined? x
puts(r)
```

Output:

```
local-variable

method
constant

global-variable

expression
expression
nil
true
local-variable
```
