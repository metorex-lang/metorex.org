---
title: "oop/module_name.rb"
slug: oop-module-name
description: "The metorex example program oop/module_name.rb and its output."
---

`tests/_examples/oop/module_name.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_name.rb).

```metorex
module Outer
end

module Outer::Inner
end

anonymous = Module.new
module anonymous::Nested; end

puts Module.new.name.inspect
puts Outer::Inner.name.inspect
puts Module.new.singleton_class.name.inspect
puts String.singleton_class.name.inspect
puts anonymous::Nested.name.start_with?("#<Module:0x").inspect
puts anonymous::Nested.name.end_with?("::Nested").inspect

Outer::Inner::Bound = anonymous
puts anonymous.name.inspect
puts anonymous::Nested.name.inspect

module Outer
  Conditional ||= Module.new
end
puts Outer::Conditional.name.inspect

Outer::AlsoConditional ||= Module.new
puts Outer::AlsoConditional.name.inspect

names = ["ab", "cd"]
puts names.one?(/a/).inspect
puts names.none?(/z/).inspect
puts "text".encoding.inspect
```

Output:

```
nil
"Outer::Inner"
nil
nil
true
true
"Outer::Inner::Bound"
"Outer::Inner::Bound::Nested"
"Outer::Conditional"
"Outer::AlsoConditional"
true
true
#<Encoding:UTF-8>
```
