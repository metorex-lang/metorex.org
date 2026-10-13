---
title: "metaprogramming/module_constants.rb"
slug: metaprogramming-module-constants
description: "The metorex example program metaprogramming/module_constants.rb and its output."
---

`tests/_examples/metaprogramming/module_constants.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/module_constants.rb){target=_blank rel=noopener}.

```metorex
# Module#constants — written without parentheses where possible. Covers
# own constants, mixin constants (transitively), the inherit flag,
# private_constant filtering, Symbol indexing, and Array difference.
module Deep
  DEEP_CONST = 1
end

module Shallow
  include Deep
  SHALLOW_CONST = 2
end

class Holder
  include Shallow
  OWN_CONST = 3
  SECRET = 4
  private_constant :SECRET
end

puts Holder.constants.sort.inspect
puts Holder.constants(false).sort.inspect
puts Holder.constants(nil).sort.inspect

inherited_only = Holder.constants - Holder.constants(false)
puts inherited_only.sort.inspect

sym = :Word
puts sym[0]
puts sym[0] == sym[0].upcase

count = Module.constants.size
module AddedTop
end
puts Module.constants.size == count + 1
puts Module.constants.include?(:Array)
Object.send :remove_const, :AddedTop
```

Output:

```
[:DEEP_CONST, :OWN_CONST, :SHALLOW_CONST]
[:OWN_CONST]
[:OWN_CONST]
[:DEEP_CONST, :SHALLOW_CONST]
W
true
true
true
```
