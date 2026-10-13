---
title: "oop/ancestors_module_include.rb"
slug: oop-ancestors-module-include
description: "The metorex example program oop/ancestors_module_include.rb and its output."
---

`tests/_examples/oop/ancestors_module_include.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/ancestors_module_include.rb).

```metorex
module Basic
  def public_module; end
end

module Sup
  include Basic
  def public_super_module; end
end

puts Basic.ancestors.inspect
puts Sup.ancestors.inspect

puts "---"
puts Sup.ancestors == [Sup, Basic]
puts Sup.ancestors.first == Sup
puts Sup.ancestors[1] == Basic
puts "---"
puts [Sup, Basic].inspect
```

Output:

```
[Basic]
[Sup, Basic]
---
true
true
true
---
[Sup, Basic]
```
