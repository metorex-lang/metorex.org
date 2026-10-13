---
title: "oop/method_added_hook.rb"
slug: oop-method-added-hook
description: "The metorex example program oop/method_added_hook.rb and its output."
---

`tests/_examples/oop/method_added_hook.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/method_added_hook.rb).

```metorex
$events = []

class Parent
  def inherited_method
  end
end

class Tracked < Parent
  def self.method_added name
    $events << [:added, name]
  end

  def self.singleton_method_added name
    $events << [:singleton, name]
  end

  def first
  end

  alias_method :aliased, :first
  alias aliased_again first

  private :inherited_method
  public :inherited_method

  def retired
  end
  undef_method :retired
end

puts $events.inspect
puts Tracked.method_defined?(:retired).inspect
puts Tracked.instance_methods(false).sort.inspect
puts Module.new.method_added(:anything).inspect
puts Module.private_instance_methods.include?(:method_added).inspect
```

Output:

```
[[:singleton, :singleton_method_added], [:added, :first], [:added, :aliased], [:added, :aliased_again], [:added, :inherited_method], [:added, :retired]]
false
[:aliased, :aliased_again, :first, :inherited_method]
nil
true
```
