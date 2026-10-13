---
title: "methods/setter_on_a_class_needs_a_class_method.rb"
slug: methods-setter-on-a-class-needs-a-class-method
description: "The metorex example program methods/setter_on_a_class_needs_a_class_method.rb and its output."
---

`tests/_examples/methods/setter_on_a_class_needs_a_class_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/setter_on_a_class_needs_a_class_method.rb){target=_blank rel=noopener}.

```metorex
module Settings
  def level=(value)
    @level = value
  end
end

class Widget
  def size=(value)
    @size = value
  end
end

[-> { Settings.level = 1 }, -> { Widget.size = 2 }, -> { Widget.color = 3 }].each do |assignment|
  assignment.call
rescue NoMethodError => error
  puts error.message
end

p Widget.class_variables
```

Output:

```
undefined method 'level=' for module Settings
undefined method 'size=' for class Widget
undefined method 'color=' for class Widget
[]
```
