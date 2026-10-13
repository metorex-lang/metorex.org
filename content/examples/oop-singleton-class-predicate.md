---
title: "oop/singleton_class_predicate.rb"
slug: oop-singleton-class-predicate
description: "The metorex example program oop/singleton_class_predicate.rb and its output."
---

`tests/_examples/oop/singleton_class_predicate.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/singleton_class_predicate.rb).

```metorex
class Holder
end

instance = Holder.new

puts Holder.singleton_class?.inspect
puts Holder.singleton_class.singleton_class?.inspect
puts instance.singleton_class.singleton_class?.inspect
puts NilClass.singleton_class?.inspect
puts TrueClass.singleton_class?.inspect
puts FalseClass.singleton_class?.inspect
puts Module.new.singleton_class?.inspect

opened = class << instance
  self
end
puts opened.singleton_class?.inspect
```

Output:

```
false
true
true
false
false
false
false
true
```
