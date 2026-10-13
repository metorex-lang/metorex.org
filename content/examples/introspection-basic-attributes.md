---
title: "introspection/basic_attributes.rb"
slug: introspection-basic-attributes
description: "The metorex example program introspection/basic_attributes.rb and its output."
---

`tests/_examples/introspection/basic_attributes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/basic_attributes.rb){target=_blank rel=noopener}.

```metorex
def greet(name)
  "Hello, " + name
end

def calculate(x, y)
  x + y
end

puts "greet.name = #{method(:greet).name}"
puts "calculate.name = #{method(:calculate).name}"
puts "greet.doc = #{nil}"
puts "calculate.doc = #{nil}"
```

Output:

```
greet.name = greet
calculate.name = calculate
greet.doc = 
calculate.doc = 
```
