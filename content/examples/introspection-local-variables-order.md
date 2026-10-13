---
title: "introspection/local_variables_order.rb"
slug: introspection-local-variables-order
description: "The metorex example program introspection/local_variables_order.rb and its output."
---

`tests/_examples/introspection/local_variables_order.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/local_variables_order.rb){target=_blank rel=noopener}.

```metorex
def declared_in_order
  third = 3
  first = 1
  second = 2
  binding.local_variables
end
puts(declared_in_order.inspect)

def own_locals_come_before_enclosing_ones
  outer_one = 1
  outer_two = 2
  proc { inner_one = 3; binding.local_variables }.call
end
puts(own_locals_come_before_enclosing_ones.inspect)

def a_local_shadowing_a_builtin_is_still_a_local
  p = proc { :shadowing }
  binding.local_variables
end
puts(a_local_shadowing_a_builtin_is_still_a_local.inspect)
```

Output:

```
[:third, :first, :second]
[:inner_one, :outer_one, :outer_two]
[:p]
```
