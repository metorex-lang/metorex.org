---
title: "introspection/what_the_space_holds.rb"
slug: introspection-what-the-space-holds
description: "The metorex example program introspection/what_the_space_holds.rb and its output."
---

`tests/_examples/introspection/what_the_space_holds.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/what_the_space_holds.rb).

```metorex
# What the object space can say about a program: the readings the collector
# reports, how much has been built, and what one object refers to.
readings = GC.stat
puts readings.is_a?(Hash).to_s
puts readings[:count].is_a?(Integer).to_s
puts GC.stat(:count).is_a?(Integer).to_s

require "objspace"
made = Class.new
before = ObjectSpace.memsize_of_all(made)
made.new
puts (ObjectSpace.memsize_of_all(made) > before).to_s

held = Object.new
box = ["a", held]
reachable = ObjectSpace.reachable_objects_from(box)
puts reachable.include?(held).to_s
puts reachable.include?(Array).to_s
p ObjectSpace.reachable_objects_from(42)
```

Output:

```
true
true
true
true
true
true
nil
```
