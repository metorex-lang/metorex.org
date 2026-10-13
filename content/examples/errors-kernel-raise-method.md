---
title: "errors/kernel_raise_method.rb"
slug: errors-kernel-raise-method
description: "The metorex example program errors/kernel_raise_method.rb and its output."
---

`tests/_examples/errors/kernel_raise_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/kernel_raise_method.rb){target=_blank rel=noopener}.

```metorex
begin
  raise "keyword form"
rescue RuntimeError => error
  puts error.message
end

class Thrower
  def throw_it
    send(:raise, ArgumentError, "through send")
  end
end

begin
  Thrower.new.throw_it
rescue ArgumentError => error
  puts "#{error.class}: #{error.message}"
end

raiser = Object.new
class << raiser
  public :raise
end

begin
  raiser.raise TypeError, "with a receiver"
rescue TypeError => error
  puts "#{error.class}: #{error.message}"
end

begin
  Kernel.raise IndexError, "on Kernel"
rescue IndexError => error
  puts "#{error.class}: #{error.message}"
end

begin
  Kernel.method(:raise).call KeyError, "through a Method object"
rescue KeyError => error
  puts "#{error.class}: #{error.message}"
end

puts Kernel.private_instance_methods(false).include?(:raise)

# A bare raise with nothing to re-raise makes a RuntimeError whose message is
# empty. The "unhandled exception" wording belongs to the uncaught report.
begin
  raise
rescue RuntimeError => error
  puts error.class.to_s
  puts error.message.inspect
end
```

Output:

```
keyword form
ArgumentError: through send
TypeError: with a receiver
IndexError: on Kernel
KeyError: through a Method object
true
RuntimeError
""
```
