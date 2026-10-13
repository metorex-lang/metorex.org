---
title: "introspection/locals_assigned_later.rb"
slug: introspection-locals-assigned-later
description: "The metorex example program introspection/locals_assigned_later.rb and its output."
---

`tests/_examples/introspection/locals_assigned_later.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/locals_assigned_later.rb){target=_blank rel=noopener}.

```metorex
# `local_variables` lists every local of a scope, the ones assigned further
# down among them, inside blocks as well, while a block written above an
# assignment still cannot read that local.
def listed
  p(local_variables)
  first = 1
  [1].each do |item|
    [2].each { p(local_variables, binding.local_variables) }
    inner = 2
  end
  later = proc { p(local_variables) }
  last = 3
  later.call
end
listed

def early_read
  [1].each do
    p(missing)
  rescue NameError => error
    p(error.class)
  end
  missing = 1
  [1].each { p(missing) }
end
early_read

p(local_variables)
[1].each { p(local_variables) }
top = 1
```

Output:

```
[:first, :later, :last]
[:item, :inner, :first, :later, :last]
[:item, :inner, :first, :later, :last]
[:first, :later, :last]
NameError
1
[:top]
[:top]
```
