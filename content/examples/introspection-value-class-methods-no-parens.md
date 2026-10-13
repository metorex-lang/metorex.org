---
title: "introspection/value_class_methods_no_parens.rb"
slug: introspection-value-class-methods-no-parens
description: "The metorex example program introspection/value_class_methods_no_parens.rb and its output."
---

`tests/_examples/introspection/value_class_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/value_class_methods_no_parens.rb){target=_blank rel=noopener}.

```metorex
# nil, true and false report the methods of their own classes, and each of
# those methods is owned by that class.
[nil, true, false].each do |value|
  listed = value.class.instance_methods(false).sort
  p listed
  p listed.map { |name| value.method(name).owner }.uniq
end
p nil.method(:to_a).call
p true.method(:&).call(false)
p false.method(:inspect).unbind.bind(false).call
p nil.method(:object_id).owner
```

Output:

```
[:&, :===, :=~, :^, :inspect, :nil?, :rationalize, :to_a, :to_c, :to_f, :to_h, :to_i, :to_r, :to_s, :|]
[NilClass]
[:&, :===, :^, :inspect, :to_s, :|]
[TrueClass]
[:&, :===, :^, :inspect, :to_s, :|]
[FalseClass]
[]
false
"false"
Kernel
```
