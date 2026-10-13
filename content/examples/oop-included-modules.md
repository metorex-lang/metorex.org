---
title: "oop/included_modules.rb"
slug: oop-included-modules
description: "The metorex example program oop/included_modules.rb and its output."
---

`tests/_examples/oop/included_modules.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/included_modules.rb).

```metorex
module Base
end

module Middle
  include Base
end

class Plain
end

class Layered < Plain
  include Middle
end

puts Base.included_modules.inspect
puts Middle.included_modules.inspect
puts Layered.included_modules.inspect
puts Plain.included_modules.inspect
```

Output:

```
[]
[Base]
[Middle, Base, Kernel]
[Kernel]
```
