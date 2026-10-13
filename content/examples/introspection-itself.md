---
title: "introspection/itself.rb"
slug: introspection-itself
description: "The metorex example program introspection/itself.rb and its output."
---

`tests/_examples/introspection/itself.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/itself.rb){target=_blank rel=noopener}.

```metorex
class Widget
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

widget = Widget.new("gear")
puts widget.itself.name
puts widget.itself.equal?(widget)

puts 42.itself
puts "text".itself
puts :symbol.itself.inspect
puts nil.itself.inspect

numbers = [3, 1, 2]
puts numbers.itself.inspect
puts numbers.map { |value| value.itself }.inspect

puts Widget.itself.name

begin
  widget.itself(1)
rescue ArgumentError => error
  puts error.class
end
```

Output:

```
gear
true
42
text
:symbol
nil
[3, 1, 2]
[3, 1, 2]
Widget
ArgumentError
```
