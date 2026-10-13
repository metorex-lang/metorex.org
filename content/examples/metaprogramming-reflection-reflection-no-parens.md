---
title: "metaprogramming/reflection/reflection_no_parens.rb"
slug: metaprogramming-reflection-reflection-no-parens
description: "The metorex example program metaprogramming/reflection/reflection_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/reflection/reflection_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/reflection/reflection_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Reflection and Introspection without parentheses (where possible)

class Animal
  def speak
    "..."
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end

  def fetch(item)
    "Fetching #{item}"
  end
end

puts "=== class ==="
d = Dog.new
puts d.class
puts "hello".class
puts 42.class
arr = [1, 2]
puts arr.class

puts ""
puts "=== instance_of? ==="
puts d.instance_of?(Dog)
puts d.instance_of?(Animal)

puts ""
puts "=== is_a? ==="
puts d.is_a?(Dog)
puts d.is_a?(Animal)

puts ""
puts "=== respond_to? ==="
puts d.respond_to?("speak")
puts d.respond_to?("fetch")
puts d.respond_to?("nonexistent")

puts ""
puts "=== methods ==="
m = d.methods - Object.new.methods
puts m.sort.inspect

puts ""
puts "=== send ==="
puts d.send("speak")
puts d.send("fetch", "ball")

puts ""
puts "=== send with symbol ==="
puts d.send(:speak)
puts d.send(:fetch, "stick")

puts ""
puts "=== send on built-in ==="
puts "hello".send("upcase")
puts "hello".send("length")
```

Output:

```
=== class ===
Dog
String
Integer
Array

=== instance_of? ===
true
false

=== is_a? ===
true
true

=== respond_to? ===
true
true
false

=== methods ===
[:fetch, :speak]

=== send ===
Woof!
Fetching ball

=== send with symbol ===
Woof!
Fetching stick

=== send on built-in ===
HELLO
5
```
