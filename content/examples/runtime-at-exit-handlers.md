---
title: "runtime/at_exit_handlers.rb"
slug: runtime-at-exit-handlers
description: "The metorex example program runtime/at_exit_handlers.rb and its output."
---

`tests/_examples/runtime/at_exit_handlers.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/at_exit_handlers.rb).

```metorex
begin
  at_exit
rescue ArgumentError => error
  puts error.message
end

puts Kernel.private_instance_methods.include? :at_exit

at_exit { puts "registered first" }
at_exit do
  puts "outer"
  at_exit { puts "nested" }
  puts "outer done"
end
at_exit { puts "registered last" }

puts "main body"
```

Output:

```
called without a block
true
main body
registered last
outer
outer done
nested
registered first
```
