---
title: "methods/undef_inherited_core_methods.rb"
slug: methods-undef-inherited-core-methods
description: "The metorex example program methods/undef_inherited_core_methods.rb and its output."
---

`tests/_examples/methods/undef_inherited_core_methods.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/undef_inherited_core_methods.rb).

```metorex
class BlankSlate
  kept = [:__id__, :__send__, :object_id, :class, :respond_to?]
  instance_methods.each do |name|
    undef_method(name) unless kept.include?(name)
  end
end

p BlankSlate.instance_methods.sort
```

Output:

```
[:__id__, :__send__, :class, :object_id, :respond_to?]
```
