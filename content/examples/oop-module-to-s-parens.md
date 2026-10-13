---
title: "oop/module_to_s_parens.rb"
slug: oop-module-to-s-parens
description: "The metorex example program oop/module_to_s_parens.rb and its output."
---

`tests/_examples/oop/module_to_s_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_to_s_parens.rb).

```metorex
module Named
end

puts(Named.to_s)
puts(String.to_s)
puts(Module.new.to_s.start_with?("#<Module:0x").inspect)
puts(Class.new.to_s.start_with?("#<Class:0x").inspect)
puts(Named.singleton_class.to_s)
puts(String.singleton_class.to_s)

anonymous = Class.new
object = anonymous.new
puts((object.singleton_class.to_s == "#<Class:#{object}>").inspect)
puts(object.to_s.start_with?("#<#<Class:0x").inspect)

module Refiner
  Upcase = refine String do
  end
end

puts(Refiner::Upcase.name.inspect)
puts(Refiner::Upcase.to_s)
```

Output:

```
Named
String
true
true
#<Class:Named>
#<Class:String>
true
true
"Refiner::Upcase"
#<refinement:String@Refiner>
```
