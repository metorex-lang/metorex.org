---
title: "oop/method_removed_hook.rb"
slug: oop-method-removed-hook
description: "The metorex example program oop/method_removed_hook.rb and its output."
---

`tests/_examples/oop/method_removed_hook.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/method_removed_hook.rb){target=_blank rel=noopener}.

```metorex
$events = []

Tracked = Module.new do
  def self.method_removed name
    $events << [:removed, name]
  end

  def self.method_undefined name
    $events << [:undefined, name]
  end

  def doomed
  end

  def shadowed
  end

  remove_method :doomed
  undef_method :shadowed
end

puts $events.inspect
puts Tracked.instance_methods(false).inspect
puts Module.new.method_removed(:anything).inspect
puts Module.private_instance_methods.include?(:method_removed).inspect

frozen = Module.new
frozen.freeze
begin
  frozen.alias_method :a, :b
rescue FrozenError => error
  puts error.message
end
```

Output:

```
[[:removed, :doomed], [:undefined, :shadowed]]
[]
nil
true
can't modify frozen Module: 
```
