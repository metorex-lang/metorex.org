---
title: "advanced/type_annotations.rb"
slug: advanced-type-annotations
description: "The metorex example program advanced/type_annotations.rb and its output."
---

`tests/_examples/advanced/type_annotations.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/type_annotations.rb).

```metorex
# Type annotations example
# Note: Ruby doesn't have built-in type annotations in method signatures
# This demonstrates methods without type annotations

def calculate(x, y)
  return x + y
end

def multiply(a, b)
  a * b
end

# Usage examples
result1 = calculate(5, 10)
puts result1

result2 = multiply(3, 4)
puts result2
```
