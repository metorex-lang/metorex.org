---
title: "metaprogramming/class_eval.rb"
slug: metaprogramming-class-eval
description: "The metorex example program metaprogramming/class_eval.rb and its output."
---

`tests/_examples/metaprogramming/class_eval.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_eval.rb).

```metorex
# Module#class_eval / module_eval — block and string forms, written without
# parentheses wherever possible.

class Widget
end

# Block form: defines an instance method on the receiver and yields the class.
Widget.class_eval do |klass|
  def describe
    "a widget"
  end
  puts klass == Widget
end

puts Widget.new.describe

# Block form returns the value of its last expression.
puts Widget.class_eval { 40 + 2 }

# String form: evaluated in the context of the receiver.
puts Widget.class_eval "1 + 1"
puts Widget.class_eval("self") == Widget

# String form defines methods too.
Widget.class_eval "def loud; describe.upcase; end"
puts Widget.new.loud

# The optional filename / lineno drive __FILE__ and __LINE__.
puts Widget.class_eval("[__FILE__, __LINE__]", "custom.rb", 102).inspect

# module_eval is an alias and behaves the same on a Module.
module Trait
end
Trait.module_eval "def tagged; :ok; end"
class Carrier
  include Trait
end
puts Carrier.new.tagged.inspect
```

Output:

```
true
a widget
42
2
true
A WIDGET
["custom.rb", 102]
:ok
```
