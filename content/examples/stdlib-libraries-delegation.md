---
title: "stdlib_libraries/delegation.rb"
slug: stdlib-libraries-delegation
description: "The metorex example program stdlib_libraries/delegation.rb and its output."
---

`tests/_examples/stdlib_libraries/delegation.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/delegation.rb).

```metorex
# Delegation. A delegator stands in front of another object and passes on
# what it is asked, so a class can add to an object's behaviour without
# inheriting from its class.

require 'delegate'

# A SimpleDelegator holds the object in a slot of its own.
held = SimpleDelegator.new [3, 1, 2]
p held.sort
p held.length
p held == [3, 1, 2]

# Comparison against the delegator itself is settled by the delegator, since
# the object behind it has never heard of it.
p held.equal? held
p held.equal? [3, 1, 2]

# The object standing behind it can be swapped out.
held.__setobj__ "text"
p held.upcase
p held.__getobj__

# A subclass adds to what the object behind it does.
class Loud < SimpleDelegator
  def shout
    "#{__getobj__.upcase}!"
  end
end

loud = Loud.new "hello"
p loud.shout
p loud.length
p loud.is_a? Loud

# `DelegateClass` builds a class that carries the named class's methods, so
# it answers to them before any object is standing behind it.
Boxed = DelegateClass Array
box = Boxed.new [1, 2, 3]
p box.first
p box.sum

# A weak reference delegates the same way, and says whether the object it
# was made for is still there.
require 'weakref'

target = Object.new
def target.label
  :named
end
reference = WeakRef.new target
p reference.label
p reference.weakref_alive?
```

Output:

```
[1, 2, 3]
3
true
true
false
"TEXT"
"text"
"HELLO!"
5
true
1
6
:named
true
```
