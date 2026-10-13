---
title: "metaprogramming/class_exec_parens.rb"
slug: metaprogramming-class-exec-parens
description: "The metorex example program metaprogramming/class_exec_parens.rb and its output."
---

`tests/_examples/metaprogramming/class_exec_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_exec_parens.rb){target=_blank rel=noopener}.

```metorex
# Module#class_exec / module_exec — block evaluated in the receiver's context,
# with the caller's arguments passed to the block. Written with explicit
# parentheses everywhere.

class Gadget
end

# Defines an instance method on the receiver.
Gadget.class_exec do
  def name
    "gadget"
  end
end
puts(Gadget.new.name)

# Arguments are passed straight through to the block parameters.
puts(Gadget.class_exec(6, 7) { |a, b| a * b })

# Returns the block's last value.
puts(Gadget.class_exec { 1 + 1 })

# module_exec is the alias and behaves the same on a Module.
module Marker
end
Marker.module_exec("tag") do |label|
  define_method(:label) { label }
end
class Holder
  include Marker
end
puts(Holder.new.label)

# An instance of a Module subclass is itself a module and answers class_exec.
class NamedModule < Module
end
puts(NamedModule.new.class_exec { 40 + 2 })
```

Output:

```
gadget
42
2
tag
42
```
