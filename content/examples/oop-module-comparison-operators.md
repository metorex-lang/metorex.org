---
title: "oop/module_comparison_operators.rb"
slug: oop-module-comparison-operators
description: "The metorex example program oop/module_comparison_operators.rb and its output."
---

`tests/_examples/oop/module_comparison_operators.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_comparison_operators.rb).

```metorex
module Basic
end

module Super
  include Basic
end

class Parent
end

class Child < Parent
  include Super
end

puts (Child > Parent).inspect
puts (Parent > Child).inspect
puts (Child > Child).inspect
puts (Parent > Basic).inspect

puts (Child < Parent).inspect
puts (Parent < Child).inspect
puts (Child <= Child).inspect
puts (Child >= Child).inspect
puts (Basic >= Super).inspect
puts (Super <= Basic).inspect
puts (Basic < Parent).inspect

begin
  Parent > Object.new
rescue TypeError => error
  puts error.message
end
```

Output:

```
false
true
false
nil
true
false
true
true
true
true
nil
compared with non class/module
```
