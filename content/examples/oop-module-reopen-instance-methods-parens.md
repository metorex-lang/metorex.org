---
title: "oop/module_reopen_instance_methods_parens.rb"
slug: oop-module-reopen-instance-methods-parens
description: "The metorex example program oop/module_reopen_instance_methods_parens.rb and its output."
---

`tests/_examples/oop/module_reopen_instance_methods_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_reopen_instance_methods_parens.rb){target=_blank rel=noopener}.

```metorex
class Module
  def described
    "module method on #{name}"
  end
end

class Class
  def built
    "class method on #{name}"
  end
end

module Mixin
end

class Widget
end

puts(Mixin.described)
puts(Widget.described)
puts(Widget.built)
puts(Widget.respond_to?(:described))
```

Output:

```
module method on Mixin
module method on Widget
class method on Widget
true
```
