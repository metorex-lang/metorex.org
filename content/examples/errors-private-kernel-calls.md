---
title: "errors/private_kernel_calls.rb"
slug: errors-private-kernel-calls
description: "The metorex example program errors/private_kernel_calls.rb and its output."
---

`tests/_examples/errors/private_kernel_calls.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/private_kernel_calls.rb){target=_blank rel=noopener}.

```metorex
# Kernel's functions and BasicObject's hooks are private methods of every
# object: a call written with a receiver other than `self` is refused, and
# `send` reaches them.
class Speaker
  public :puts
end

class Forwarder
  def method_missing(name, *args)
    "forwarded #{name} with #{args.inspect}"
  end

  def respond_to_missing?(name, include_private = false) = true
end

def attempt
  p(yield)
rescue NoMethodError, ArgumentError => error
  p([error.class, error.message])
end

attempt { Object.new.puts("hidden") }
attempt { nil.raise }
attempt { [1].format("%d", 1) }
attempt { Speaker.new.puts("spoken") }
attempt { Forwarder.new.puts("anything") }
attempt { Object.new.send(:initialize) }
attempt { Object.new.send(:initialize, 1) }
attempt { Object.new.initialize }
attempt { Object.new.send(:singleton_method_added, :name) }
attempt { Object.new.send(:method_missing, :absent) }
attempt { Object.new.send(:method_missing) }
attempt { Object.new.send(:method_missing, "absent") }
attempt { $stdout.respond_to?(:puts) }
attempt { Object.new.respond_to?(:puts) }
attempt { Object.new.respond_to?(:puts, true) }

def asks = iterator?
p([asks, asks {}])
p(send(:instance_variables_to_inspect))

# A method the program writes with an empty body runs as the empty method,
# though a native method of the same name exists.
class Quiet
  def initialize
  end

  def to_s
  end
end
p(Quiet.new.to_s)
```

Output:

```
[NoMethodError, "private method 'puts' called for an instance of Object"]
[NoMethodError, "private method 'raise' called for nil"]
[NoMethodError, "private method 'format' called for an instance of Array"]
spoken
nil
"forwarded puts with [\"anything\"]"
nil
[ArgumentError, "wrong number of arguments (given 1, expected 0)"]
[NoMethodError, "private method 'initialize' called for an instance of Object"]
nil
[NoMethodError, "private method 'absent' called for an instance of Object"]
[ArgumentError, "no method name given"]
[ArgumentError, "method name must be a Symbol but String is given"]
true
false
true
[false, true]
nil
nil
```
