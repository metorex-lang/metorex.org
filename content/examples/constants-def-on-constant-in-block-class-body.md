---
title: "constants/def_on_constant_in_block_class_body.rb"
slug: constants-def-on-constant-in-block-class-body
description: "The metorex example program constants/def_on_constant_in_block_class_body.rb and its output."
---

`tests/_examples/constants/def_on_constant_in_block_class_body.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/constants/def_on_constant_in_block_class_body.rb).

```metorex
class Nest; end
Object.new.instance_exec do
  class Nest
    TARGET = Object.new
    def TARGET.defs_method = :called
    p [:class_singleton, singleton_class.instance_methods(false)]
    p [:class_own, instance_methods(false)]
  end
  p [:receiver_singleton, singleton_methods]
end
proc do
  class Nest
    OTHER = Object.new
    def OTHER.other_method = :called
  end
end.call
p Nest::OTHER.singleton_methods
```

Output:

```
[:class_singleton, []]
[:class_own, []]
[:receiver_singleton, []]
[:other_method]
```
