---
title: "callables/copies_and_visibility_parens.rb"
slug: callables-copies-and-visibility-parens
description: "The metorex example program callables/copies_and_visibility_parens.rb and its output."
---

`tests/_examples/callables/copies_and_visibility_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/copies_and_visibility_parens.rb){target=_blank rel=noopener}.

```metorex
# A copy of a callable is its own object that still compares equal, and
# `public_send` reaches only what a caller outside the object could write.
class Holder
  def open_door
    :open
  end

  def shut_door
    :shut
  end
  protected :shut_door

  def hidden_door
    :hidden
  end
  private :hidden_door
end

held = Holder.new
taken = held.method(:open_door)
copied = taken.clone

p(copied == taken)
p(copied.equal?(taken))
p(copied.call)

taken.instance_variable_set(:@note, :kept)
p(taken.clone.instance_variables)

step = proc { :stepped }
p(step.dup == step)
p(step.dup.equal?(step))

p(held.public_send(:open_door))

[:shut_door, :hidden_door].each do |named|
  begin
    held.public_send(named)
  rescue NoMethodError => refused
    puts(refused.message)
  end
end

p(:upcase.to_proc.lambda?)
p(:upcase.to_proc.parameters)
p(:upcase.to_proc.call("shout"))
```

Output:

```
true
false
:open
[:@note]
true
false
:open
protected method 'shut_door' called for an instance of Holder
private method 'hidden_door' called for an instance of Holder
true
[[:req], [:rest]]
"SHOUT"
```
