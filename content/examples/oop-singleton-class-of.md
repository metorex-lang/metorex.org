---
title: "oop/singleton_class_of.rb"
slug: oop-singleton-class-of
description: "The metorex example program oop/singleton_class_of.rb and its output."
---

`tests/_examples/oop/singleton_class_of.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/singleton_class_of.rb){target=_blank rel=noopener}.

```metorex
widget = Object.new
opened = class << widget
  self
end
puts (opened == widget.singleton_class)

puts (nil.singleton_class == NilClass)
puts (true.singleton_class == TrueClass)
puts (false.singleton_class == FalseClass)

[42, 3.14, :name].each do |value|
  begin
    value.singleton_class
  rescue TypeError => error
    puts "#{error.class}: #{error.message}"
  end
end

frozen = Object.new
frozen.freeze
puts frozen.singleton_class.frozen?

thawed = Object.new
puts thawed.singleton_class.frozen?

puts (-"deduplicated")
puts (+"mutable")
```

Output:

```
true
true
true
true
TypeError: can't define singleton
TypeError: can't define singleton
TypeError: can't define singleton
true
false
deduplicated
mutable
```
