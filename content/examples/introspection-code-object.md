---
title: "introspection/code_object.rb"
slug: introspection-code-object
description: "The metorex example program introspection/code_object.rb and its output."
---

`tests/_examples/introspection/code_object.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/code_object.rb){target=_blank rel=noopener}.

```metorex
def greet(name)
  "Hello, " + name
end

def calculate(x, y)
  x + y
end

greet_location = method(:greet).source_location
calculate_location = method(:calculate).source_location

puts "greet defined in #{greet_location[0].split('/').last} line #{greet_location[1]}"
puts "calculate defined in #{calculate_location[0].split('/').last} line #{calculate_location[1]}"
```

Output:

```
greet defined in code_object.rb line 1
calculate defined in code_object.rb line 5
```
