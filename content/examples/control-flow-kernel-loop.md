---
title: "control_flow/kernel_loop.rb"
slug: control-flow-kernel-loop
description: "The metorex example program control_flow/kernel_loop.rb and its output."
---

`tests/_examples/control_flow/kernel_loop.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/kernel_loop.rb).

```metorex
count = 0
loop do
  count += 1
  break if count == 10
end
puts count

puts loop { break 123 }.inspect
puts loop { break }.inspect

attempts = 0
result = loop do
  attempts += 1
  raise StopIteration if attempts == 3
end
puts attempts
puts result.inspect

class Finished < StopIteration
end

reached = 0
loop do
  reached += 1
  raise Finished
end
puts reached

anonymous_finish = Class.new StopIteration
loop do
  raise anonymous_finish
end
puts "anonymous subclass ended the loop"

begin
  loop do
    raise ArgumentError, "not swallowed"
  end
rescue ArgumentError => error
  puts "#{error.class}: #{error.message}"
end

puts Kernel.private_instance_methods(false).include?(:loop)
```

Output:

```
10
123
nil
3
nil
1
anonymous subclass ended the loop
ArgumentError: not swallowed
true
```
