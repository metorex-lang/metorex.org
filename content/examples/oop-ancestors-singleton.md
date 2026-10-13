---
title: "oop/ancestors_singleton.rb"
slug: oop-ancestors-singleton
description: "The metorex example program oop/ancestors_singleton.rb and its output."
---

`tests/_examples/oop/ancestors_singleton.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/ancestors_singleton.rb).

```metorex
module ASInternal
end

class ASParent
end

class ASChild < ASParent
  class << self
    include ASInternal
  end
end

sc = class << ASChild; self; end
puts sc.ancestors.inspect

puts "---"
puts sc.ancestors.include?(ASInternal)
puts sc.ancestors.include?(Class)
puts sc.ancestors.include?(Module)
puts sc.ancestors.include?(Object)
puts sc.ancestors.include?(Kernel)
```

Output:

```
[#<Class:ASChild>, ASInternal, #<Class:ASParent>, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]
---
true
true
true
true
true
```
