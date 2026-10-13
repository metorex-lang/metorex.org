---
title: "struct/shaped_by_initialize.rb"
slug: struct-shaped-by-initialize
description: "The metorex example program struct/shaped_by_initialize.rb and its output."
---

`tests/_examples/struct/shaped_by_initialize.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/struct/shaped_by_initialize.rb){target=_blank rel=noopener}.

```metorex
# A Struct writes its own `initialize`: it is private, assigns the members it
# is given, and a struct class built from a subclass of Struct stands under
# that subclass.
Point = Struct.new :x, :y

p Point.private_instance_methods(false).include?(:initialize) ||
  Struct.private_instance_methods(false).include?(:initialize)

here = Point.new 1, 2
here.instance_eval { initialize 3, 4 }
p [here.x, here.y]

here.instance_eval { initialize 5 }
p [here.x, here.y]

begin
  here.instance_eval { initialize 6, 7, 8 }
rescue ArgumentError => error
  p error.message
end

class Tagged < Struct
  attr_reader :tag

  def initialize(*)
    @tag = :tagged
    super
  end
end

Labelled = Tagged.new :name
held = Labelled.new "held"
p [held.name, held.tag]
p Labelled.superclass == Tagged
```

Output:

```
true
[3, 4]
[5, nil]
"struct size differs"
["held", :tagged]
true
```
