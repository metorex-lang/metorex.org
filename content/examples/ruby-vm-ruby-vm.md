---
title: "ruby_vm/ruby_vm.rb"
slug: ruby-vm-ruby-vm
description: "The metorex example program ruby_vm/ruby_vm.rb and its output."
---

`tests/_examples/ruby_vm/ruby_vm.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/ruby_vm.rb).

```metorex
# RubyVM names MRI's instructions and settings, answers MRI's counters, and
# remembers whether script lines are kept. It cannot be instantiated, and
# neither just-in-time compiler is running.

p(RubyVM.class, RubyVM.superclass)
p(RubyVM::OPTS)
p(RubyVM::INSTRUCTION_NAMES.size, RubyVM::INSTRUCTION_NAMES.first(5), RubyVM::INSTRUCTION_NAMES.frozen?)
p(RubyVM::DEFAULT_PARAMS)
p(RubyVM.stat.keys)
p(RubyVM.stat(:constant_cache_invalidations).is_a?(Integer))
held = {}
p(RubyVM.stat(held).equal?(held))
p(RubyVM.keep_script_lines)
RubyVM.keep_script_lines = true
p(RubyVM.keep_script_lines)
p(RubyVM.singleton_methods.sort)
def attempt
  yield
rescue => e
  [e.class, e.message]
end
p(attempt { RubyVM.stat(:nope) })
p(attempt { RubyVM.stat("x") })
p(attempt { RubyVM.new })
p(attempt { RubyVM.allocate })
p(defined?(RubyVM::YJIT), defined?(RubyVM::ZJIT))
p(RubyVM::YJIT.enabled?, RubyVM::ZJIT.enabled?)
```

Output:

```
Class
Object
["direct threaded code", "operands unification", "inline method cache"]
248
["nop", "getlocal", "setlocal", "getblockparam", "setblockparam"]
true
{thread_vm_stack_size: 1048576, thread_machine_stack_size: 1048576, fiber_vm_stack_size: 131072, fiber_machine_stack_size: 524288}
[:constant_cache_invalidations, :constant_cache_misses, :global_cvar_state, :next_shape_id, :shape_cache_size]
true
true
false
true
[:keep_script_lines, :keep_script_lines=, :stat]
[ArgumentError, "unknown key: nope"]
[TypeError, "non-hash or symbol given"]
[NoMethodError, "undefined method 'new' for class RubyVM"]
[TypeError, "allocator undefined for RubyVM"]
"constant"
"constant"
false
false
```
