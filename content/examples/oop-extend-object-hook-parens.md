---
title: "oop/extend_object_hook_parens.rb"
slug: oop-extend-object-hook-parens
description: "The metorex example program oop/extend_object_hook_parens.rb and its output."
---

`tests/_examples/oop/extend_object_hook_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/extend_object_hook_parens.rb).

```metorex
module Greeting
  GREETING = :hello

  def greet
    "hello test"
  end
end

module RecordingExtend
  class << self
    def extend_object(obj)
      $recorded << :private_hook
    end
    private(:extend_object)
  end
end

module PublicExtend
  def self.extend_object obj
    $recorded << :public_hook
  end
end

$recorded = []

plain = Object.new
plain.extend(Greeting)
puts plain.greet
puts plain.singleton_class.const_get(:GREETING).inspect

Object.new.extend(RecordingExtend)
Object.new.extend(PublicExtend)
puts $recorded.inspect

skipped = Object.new
skipped.extend(RecordingExtend)
puts skipped.respond_to?(:greet).inspect

frozen = Object.new.freeze
begin
  Greeting.send(:extend_object, frozen)
rescue RuntimeError => error
  puts error.class
end
puts frozen.is_a?(Greeting).inspect
```

Output:

```
hello test
:hello
[:private_hook, :public_hook]
false
FrozenError
false
```
