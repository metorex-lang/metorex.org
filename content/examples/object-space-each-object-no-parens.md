---
title: "object_space/each_object_no_parens.rb"
slug: object-space-each-object-no-parens
description: "The metorex example program object_space/each_object_no_parens.rb and its output."
---

`tests/_examples/object_space/each_object_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/object_space/each_object_no_parens.rb){target=_blank rel=noopener}.

```metorex
# ObjectSpace.each_object walks the objects still alive.
class Widget
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
kept = [Widget.new(:in_an_array)]
held = { key: Widget.new(:in_a_hash) }
names = []
p ObjectSpace.each_object(Widget) { |found| names << found.name }
p names.sort
p ObjectSpace.each_object(Widget).class
p ObjectSpace.each_object(Widget).map(&:name).sort

# Classes are found too, and the singleton class of a class walks the class,
# its subclasses, and the singleton classes of their instances.
parent = Class.new
child = Class.new(parent)
lone = child.new.singleton_class
p ObjectSpace.each_object(parent.singleton_class).to_a.size
p ObjectSpace.each_object(Class).include?(child)
begin
  ObjectSpace.each_object(1) { }
rescue TypeError => error
  p error.message
end
p [kept.size, held.size, lone.nil?]
```

Output:

```
2
[:in_a_hash, :in_an_array]
Enumerator
[:in_a_hash, :in_an_array]
3
true
"class or module required"
[1, 1, false]
```
