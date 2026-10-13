---
title: "metaprogramming/singleton_hooks/removed.rb"
slug: metaprogramming-singleton-hooks-removed
description: "The metorex example program metaprogramming/singleton_hooks/removed.rb and its output."
---

`tests/_examples/metaprogramming/singleton_hooks/removed.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/singleton_hooks/removed.rb){target=_blank rel=noopener}.

```metorex
# `singleton_method_removed` fires when a singleton method goes, including
# from a `class << obj` body, which reaches a method put there by
# `def obj.name`.

klass = Class.new

def klass.singleton_method_removed(name)
  puts "class lost #{name}"
end

def klass.to_remove
end

class << klass
  remove_method :to_remove
end

puts klass.respond_to?(:to_remove).to_s

object = Object.new

def object.singleton_method_removed(name)
  puts "object lost #{name}"
end

def object.gone
end

class << object
  remove_method :gone
end

puts object.respond_to?(:gone).to_s

# Removing a name nothing defines is a NameError.
begin
  class << object
    remove_method :never_there
  end
rescue NameError => error
  puts error.class.to_s
end
```

Output:

```
class lost to_remove
false
object lost gone
false
NameError
```
