---
title: "type_annotations/mixed_annotated.rb"
slug: type-annotations-mixed-annotated
description: "The metorex example program type_annotations/mixed_annotated.rb and its output."
---

`tests/_examples/type_annotations/mixed_annotated.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/type_annotations/mixed_annotated.rb){target=_blank rel=noopener}.

```metorex
x = 100  # int
y = "test"  # str

z = 50
message = "hello"

def calculate(a, b)  # int, int -> int
  a + b
end

def process(value)
  value * 2
end

result1 = calculate(x, z)
puts "calculate(100, 50) = #{result1}"

result2 = process(10)
puts "process(10) = #{result2}"

puts "x + z = #{x + z}"
puts "y + message = #{y} #{message}"
```
