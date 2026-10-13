---
title: "introspection/annotations.rb"
slug: introspection-annotations
description: "The metorex example program introspection/annotations.rb and its output."
---

`tests/_examples/introspection/annotations.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/annotations.rb).

```metorex
def add(x, y)  # int, int -> int
  x + y
end

def greet(name)  # str -> str
  "Hello, " + name
end

def process(data, count, flag)  # str, int, bool
  data
end

puts "add.parameters = #{method(:add).parameters}"
puts "greet.parameters = #{method(:greet).parameters}"
puts "process.parameters = #{method(:process).parameters}"

def no_annotations(a, b)
  a + b
end

puts "no_annotations.parameters = #{method(:no_annotations).parameters}"
```

Output:

```
add.parameters = [[:req, :x], [:req, :y]]
greet.parameters = [[:req, :name]]
process.parameters = [[:req, :data], [:req, :count], [:req, :flag]]
no_annotations.parameters = [[:req, :a], [:req, :b]]
```
