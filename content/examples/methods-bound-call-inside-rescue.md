---
title: "methods/bound_call_inside_rescue.rb"
slug: methods-bound-call-inside-rescue
description: "The metorex example program methods/bound_call_inside_rescue.rb and its output."
---

`tests/_examples/methods/bound_call_inside_rescue.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/bound_call_inside_rescue.rb).

```metorex
class Ledger
  def record(entry, amount = 0) = [entry, amount]
end

class Finder
  attr_reader :object

  def initialize(object) = @object = object

  def handle_for(message)
    if Comparable === object
      nil
    else
      ::Kernel.instance_method(:method).bind(object).call(message)
    end
  rescue NameError
    nil
  end
end

class Caller
  def initialize(finder) = @finder = finder

  def look_up(name) = @finder.handle_for(name)
end

finder = Finder.new(Ledger.new)
p finder.handle_for(:record).arity
p Caller.new(finder).look_up(:record).arity
p finder.handle_for(:missing)
```

Output:

```
-2
-2
nil
```
