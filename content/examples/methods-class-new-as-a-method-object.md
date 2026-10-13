---
title: "methods/class_new_as_a_method_object.rb"
slug: methods-class-new-as-a-method-object
description: "The metorex example program methods/class_new_as_a_method_object.rb and its output."
---

`tests/_examples/methods/class_new_as_a_method_object.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/class_new_as_a_method_object.rb).

```metorex
class Guard < ::Mutex
  NEW_MUTEX_METHOD = Guard.method(:new)

  def self.new
    NEW_MUTEX_METHOD.call
  end
end
p Guard.new.class
p Guard.method(:new).arity
held = Mutex.method(:new)
p held.call.class
class Plain
  NEW = method(:new)
end
p Plain::NEW.call.class
```

Output:

```
Guard
0
Thread::Mutex
Plain
```
