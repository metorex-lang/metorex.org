---
title: "introspection/object_id.rb"
slug: introspection-object-id
description: "The metorex example program introspection/object_id.rb and its output."
---

`tests/_examples/introspection/object_id.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/object_id.rb){target=_blank rel=noopener}.

```metorex
class Widget
end

first = Widget.new
second = Widget.new

puts first.object_id.is_a?(Integer)
puts (first.object_id == first.object_id)
puts (first.object_id == second.object_id)
puts (first.object_id == first.dup.object_id)

puts (1.object_id == 1.object_id)
puts (1.object_id == 2.object_id)
puts (:hello.object_id == :hello.object_id)
puts (:hello.object_id == :goodbye.object_id)
puts (true.object_id == true.object_id)
puts (false.object_id == false.object_id)
puts (nil.object_id == nil.object_id)
puts (3.14.object_id == 3.14.object_id)

puts nil.object_id
puts true.object_id
puts false.object_id
puts 1.object_id

puts ((-1).object_id == (2 ** 30 - 1).object_id)
puts ((-1).object_id == (2 ** 62 - 1).object_id)
```

Output:

```
true
true
false
false
true
false
true
false
true
true
true
true
4
20
0
3
false
false
```
