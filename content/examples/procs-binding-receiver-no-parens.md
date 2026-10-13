---
title: "procs/binding_receiver_no_parens.rb"
slug: procs-binding-receiver-no-parens
description: "The metorex example program procs/binding_receiver_no_parens.rb and its output."
---

`tests/_examples/procs/binding_receiver_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/procs/binding_receiver_no_parens.rb).

```metorex
# A proc's binding answers the `self` of the place the proc was written.
handler = proc { |id| id }
p handler.binding.receiver
class Holder
  def make
    proc { }
  end
end
holder = Holder.new
p holder.make.binding.receiver.equal?(holder)
p handler.dup == handler
```

Output:

```
main
true
true
```
