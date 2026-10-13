---
title: "introspection/private_methods_own_chain.rb"
slug: introspection-private-methods-own-chain
description: "The metorex example program introspection/private_methods_own_chain.rb and its output."
---

`tests/_examples/introspection/private_methods_own_chain.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/private_methods_own_chain.rb).

```metorex
# Without ancestors, a class's private methods include those of its
# superclasses' singleton classes.
class Meter
  class << self
    private
    def calibrate_all; end
  end
end

class WaterMeter < Meter
  class << self
    private
    def flush_all; end
  end
end

p WaterMeter.private_methods(false).select { |name| name.end_with?("_all") }.sort

# A method defined in a `Module.new` block is public, and the block's
# visibility does not carry past it.
built = Module.new do
  private
  def hidden; end
end
built.module_eval { def shown; end }
p built.public_instance_methods(false)
p built.private_instance_methods(false)

# A module's own instance methods are not methods of the module object.
p(Module.new { def reading; end }.respond_to?(:reading))
```

Output:

```
[:calibrate_all, :flush_all]
[:shown]
[:hidden]
false
```
