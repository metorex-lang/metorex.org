---
title: "introspection/binding_context.rb"
slug: introspection-binding-context
description: "The metorex example program introspection/binding_context.rb and its output."
---

`tests/_examples/introspection/binding_context.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/binding_context.rb){target=_blank rel=noopener}.

```metorex
class Vault
  @@shared = "password"

  def initialize(secret)
    @secret = secret
  end

  def square(n)
    n * n
  end

  def capture
    local = true
    binding
  end
end

context = Vault.new(99).capture

puts context.class
puts context.kind_of?(Binding)
puts eval("@secret", context)
puts eval("local", context)
puts eval("@@shared", context)
puts eval "square(2)", context
puts eval("self.square(2)", context)

eval "local = false", context
puts eval("local", context)

puts Kernel.binding.kind_of?(Binding)
puts Kernel.private_instance_methods.include?(:binding)
```

Output:

```
Binding
true
99
true
password
4
4
false
true
true
```
