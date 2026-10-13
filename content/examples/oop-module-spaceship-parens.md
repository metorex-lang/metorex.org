---
title: "oop/module_spaceship_parens.rb"
slug: oop-module-spaceship-parens
description: "The metorex example program oop/module_spaceship_parens.rb and its output."
---

`tests/_examples/oop/module_spaceship_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_spaceship_parens.rb).

```metorex
class Basic; end

class Parent < Basic; end

module Mixin; end

class Child < Parent
  include Mixin
end

puts((Child <=> Parent).inspect)
puts((Child <=> Basic).inspect)
puts((Child <=> Mixin).inspect)
puts((Child <=> Child).inspect)
puts((Parent <=> Child).inspect)
puts((Basic <=> Child).inspect)
puts((Parent <=> Mixin).inspect)
puts((Parent <=> Object.new).inspect)
```

Output:

```
-1
-1
-1
0
1
1
nil
nil
```
