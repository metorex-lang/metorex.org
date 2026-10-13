---
title: "metaprogramming/singleton_hooks/added_parens.rb"
slug: metaprogramming-singleton-hooks-added-parens
description: "The metorex example program metaprogramming/singleton_hooks/added_parens.rb and its output."
---

`tests/_examples/metaprogramming/singleton_hooks/added_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/singleton_hooks/added_parens.rb).

```metorex
# `singleton_method_added` fires for every way a singleton method arrives:
# `def obj.name`, a `class << obj` body, alias, and define_method.

object = Object.new

def object.singleton_method_added(name)
  puts("object gained #{name}")
end

def object.by_def
end

class << object
  def in_singleton_body
  end

  alias_method(:aliased, :in_singleton_body)

  define_method(:by_define_method) {}
end

object.define_singleton_method(:by_define_singleton_method) {}

class Host
  def self.singleton_method_added(name)
    puts "Host gained #{name}"
  end

  class << self
    def class_side
    end
  end

  def instance_side
  end
end

# A class body is a scope of its own, so it names a global rather than a
# local of the code around it. Its value is the body's own last value, not a
# re-run of it.
$counted = 0
adder = class << object
  $counted += 1
  self
end
puts($counted.to_s)
puts(adder.instance_of?(Class).to_s)
```

Output:

```
object gained singleton_method_added
object gained by_def
object gained in_singleton_body
object gained aliased
object gained by_define_method
object gained by_define_singleton_method
Host gained singleton_method_added
Host gained class_side
1
true
```
