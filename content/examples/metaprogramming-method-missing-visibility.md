---
title: "metaprogramming/method_missing/visibility.rb"
slug: metaprogramming-method-missing-visibility
description: "The metorex example program metaprogramming/method_missing/visibility.rb and its output."
---

`tests/_examples/metaprogramming/method_missing/visibility.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/method_missing/visibility.rb){target=_blank rel=noopener}.

```metorex
# A call that visibility refuses still reaches a user-defined
# `method_missing`, and the NoMethodError it raises names the method and the
# object the call was made on.

class Guarded
  def method_missing(name, *args)
    "handled #{name} with #{args.inspect}"
  end

  def hidden
    :never
  end
  private :hidden

  def shielded
    :never
  end
  protected :shielded
end

guarded = Guarded.new
puts guarded.hidden
puts guarded.shielded(1, 2)
puts guarded.absent(:arg)

class Plain
  def hidden
    :never
  end
  private :hidden
end

plain = Plain.new
begin
  plain.hidden
rescue NoMethodError => error
  puts error.message
  puts error.name.inspect
  puts error.receiver.equal?(plain).to_s
end

# `super` from an override reaches the default, which raises.
class Passthrough
  def method_missing(name, *args)
    super
  end
end

begin
  Passthrough.new.absent
rescue NoMethodError => error
  puts error.message
  puts error.name.inspect
end
```

Output:

```
handled hidden with []
handled shielded with [1, 2]
handled absent with [:arg]
private method 'hidden' called for an instance of Plain
:hidden
true
undefined method 'absent' for an instance of Passthrough
:absent
```
