---
title: "procs/kernel_proc_no_parens.rb"
slug: procs-kernel-proc-no-parens
description: "The metorex example program procs/kernel_proc_no_parens.rb and its output."
---

`tests/_examples/procs/kernel_proc_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/procs/kernel_proc_no_parens.rb){target=_blank rel=noopener}.

```metorex
plain = proc { 42 }
puts plain.lambda?
puts plain.call

stabby = -> { 7 }
wrapped = proc(&stabby)
puts wrapped.equal? stabby
puts wrapped.lambda?

class Holder
  def build
    send(:proc) { :from_send }
  end

  def no_block
    proc
  end

  def escapes
    proc { return :early }.call
    :never_reached
  end
end

holder = Holder.new
puts holder.build.call.inspect
puts holder.escapes.inspect

begin
  holder.no_block
rescue ArgumentError => error
  puts "#{error.class}: #{error.message}"
end

self_referential = nil
self_referential = proc { self_referential }
puts self_referential.equal? self_referential
puts self_referential.equal? plain

puts Kernel.private_instance_methods(false).include? :proc
```

Output:

```
false
42
true
true
:from_send
:early
ArgumentError: tried to create Proc object without a block
true
false
true
```
