---
title: "oop/prepend_features_hook.rb"
slug: oop-prepend-features-hook
description: "The metorex example program oop/prepend_features_hook.rb and its output."
---

`tests/_examples/oop/prepend_features_hook.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/prepend_features_hook.rb){target=_blank rel=noopener}.

```metorex
$events = []

Watcher = Module.new do
  def self.prepend_features mod
    $events << [:prepend_features, mod.name]
    super
  end

  def self.prepended mod
    $events << [:prepended, mod.name]
  end

  def self.append_features mod
    $events << [:append_features, mod.name]
    super
  end

  def self.included mod
    $events << [:included, mod.name]
  end

  def greet
    :greeted
  end
end

class Prepender
  prepend Watcher
end

class Includer
  include Watcher
end

puts $events.inspect
puts Prepender.new.greet.inspect
puts Includer.new.greet.inspect
puts Module.private_instance_methods.include?(:prepend_features).inspect
```

Output:

```
[[:prepend_features, "Prepender"], [:prepended, "Prepender"], [:append_features, "Includer"], [:included, "Includer"]]
:greeted
:greeted
true
```
