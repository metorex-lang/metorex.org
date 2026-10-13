---
title: "oop/module_dup_singleton_parens.rb"
slug: oop-module-dup-singleton-parens
description: "The metorex example program oop/module_dup_singleton_parens.rb and its output."
---

`tests/_examples/oop/module_dup_singleton_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_dup_singleton_parens.rb).

```metorex
mod = Module.new
def mod.hello
  :hi
end

def (nil).blank
  :blank
end

class Named
end

def Named.build
  :built
end

puts(mod.methods(false).inspect)
puts(mod.dup.methods(false).inspect)
puts(mod.dup.hello.inspect)
puts(mod.instance_methods.inspect)
puts(NilClass.instance_methods(false).sort.inspect)
puts(Named.methods(false).inspect)
puts(Named.build.inspect)
```

Output:

```
[:hello]
[:hello]
:hi
[]
[:&, :===, :=~, :^, :blank, :inspect, :nil?, :rationalize, :to_a, :to_c, :to_f, :to_h, :to_i, :to_r, :to_s, :|]
[:build]
:built
```
