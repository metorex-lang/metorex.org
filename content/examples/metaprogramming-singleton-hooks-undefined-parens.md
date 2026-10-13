---
title: "metaprogramming/singleton_hooks/undefined_parens.rb"
slug: metaprogramming-singleton-hooks-undefined-parens
description: "The metorex example program metaprogramming/singleton_hooks/undefined_parens.rb and its output."
---

`tests/_examples/metaprogramming/singleton_hooks/undefined_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/singleton_hooks/undefined_parens.rb).

```metorex
# `singleton_method_undefined` fires when a singleton method is undefined,
# and `undef_method` in a `class << Klass` body reaches a method that
# `def Klass.name` put there.

klass = Class.new

def klass.singleton_method_undefined(name)
  puts("class undefined #{name}")
end

def klass.to_undefine
end

puts(klass.respond_to?(:to_undefine).to_s)

class << klass
  undef_method(:to_undefine)
end

puts(klass.respond_to?(:to_undefine).to_s)

begin
  klass.to_undefine
rescue NoMethodError
  puts("NoMethodError after undef")
end

# Undefining a name nothing defines is a NameError.
begin
  class << klass
    undef_method(:never_there)
  end
rescue NameError => error
  puts(error.class.to_s)
end
```

Output:

```
true
class undefined to_undefine
false
NoMethodError after undef
NameError
```
