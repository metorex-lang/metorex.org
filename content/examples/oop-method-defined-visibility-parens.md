---
title: "oop/method_defined_visibility_parens.rb"
slug: oop-method-defined-visibility-parens
description: "The metorex example program oop/method_defined_visibility_parens.rb and its output."
---

`tests/_examples/oop/method_defined_visibility_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/method_defined_visibility_parens.rb){target=_blank rel=noopener}.

```metorex
module Mixin
  def public_mixin
  end

  protected

  def protected_mixin
  end

  private

  def private_mixin
  end
end

class Holder
  include(Mixin)

  def public_holder
  end

  private

  def private_holder
  end
end

class NameSource
  def to_str
    'public_mixin'
  end
end

[:public_mixin, :protected_mixin, :private_mixin, :public_holder, :private_holder].each do |name|
  puts "#{name} #{Holder.method_defined?(name)} #{Holder.public_method_defined?(name)} #{Holder.protected_method_defined?(name)} #{Holder.private_method_defined?(name)}"
end

puts(Mixin.private_instance_methods(false).inspect)
puts(Mixin.protected_instance_methods(false).inspect)
puts(Holder.method_defined?(NameSource.new).inspect)
puts(Holder.method_defined?(:public_mixin, false).inspect)

begin
  Holder.method_defined?(42)
rescue TypeError => error
  puts(error.message)
end
```

Output:

```
public_mixin true true false false
protected_mixin true false true false
private_mixin false false false true
public_holder true true false false
private_holder false false false true
[:private_mixin]
[:protected_mixin]
true
false
42 is not a symbol nor a string
```
