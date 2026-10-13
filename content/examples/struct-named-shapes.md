---
title: "struct/named_shapes.rb"
slug: struct-named-shapes
description: "The metorex example program struct/named_shapes.rb and its output."
---

`tests/_examples/struct/named_shapes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/struct/named_shapes.rb){target=_blank rel=noopener}.

```metorex
# `Struct.new` names a constant when its first argument is a String, refuses a
# repeated member, and reads keywords as members when nothing else is given.
Struct.new "Waypoint", :name, :miles
p Struct::Waypoint.name
p Struct::Waypoint.new("summit", 12).name

Point = Struct.new :across, :down
p Point.new(1, 2).to_a
p Point.new(across: 1).to_a

Keyed = Struct.new :name, :legs, keyword_init: true
p Keyed.new(name: "elefant", legs: 4).to_a
p Keyed.new({ name: "mouse", legs: 4 }).to_a

begin
  Struct.new :foo, :foo
rescue ArgumentError => problem
  puts problem.message
end

begin
  Struct.new "lowercase", :foo
rescue NameError => problem
  puts problem.class
end

begin
  Keyed.new name: "elefant", missing: 1
rescue ArgumentError => problem
  puts problem.message
end
```

Output:

```
"Struct::Waypoint"
"summit"
[1, 2]
[1, nil]
["elefant", 4]
["mouse", 4]
duplicate member: foo
NameError
unknown keywords: missing
```
