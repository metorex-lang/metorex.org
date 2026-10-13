---
title: "oop/toplevel_class_reopen.rb"
slug: oop-toplevel-class-reopen
description: "The metorex example program oop/toplevel_class_reopen.rb and its output."
---

`tests/_examples/oop/toplevel_class_reopen.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/toplevel_class_reopen.rb){target=_blank rel=noopener}.

```metorex
# `class ::Name` / `module ::Name` anchor the constant at the top level
# even when lexically nested. A bare superclass name resolves through the
# enclosing lexical scopes.
class Marker
end

module Wrapper
  class ::Marker
    TAG = :reopened_toplevel
  end

  module ::TopMod
    TAG = :toplevel_module
  end

  class Parent
    TAG = :parent
  end

  class Container
    class Child < Parent
    end
  end
end

puts Marker::TAG.inspect
puts TopMod::TAG.inspect
puts Wrapper.const_defined?(:Marker, false)
puts Wrapper.const_defined?(:TopMod, false)
puts Wrapper::Container::Child.superclass
```

Output:

```
:reopened_toplevel
:toplevel_module
false
false
Wrapper::Parent
```
