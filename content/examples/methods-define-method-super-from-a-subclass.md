---
title: "methods/define_method_super_from_a_subclass.rb"
slug: methods-define-method-super-from-a-subclass
description: "The metorex example program methods/define_method_super_from_a_subclass.rb and its output."
---

`tests/_examples/methods/define_method_super_from_a_subclass.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/define_method_super_from_a_subclass.rb){target=_blank rel=noopener}.

```metorex
module Definitions
  def calculator = :from_module
end

class Group
  include Definitions
  define_method(:calculator) { [:group, super(&nil)] }
end

class Nested < Group
  include Module.new
end

class Plain < Group
end

p Plain.new.calculator
p Nested.new.calculator
p Group.instance_method(:calculator).owner
```

Output:

```
[:group, :from_module]
[:group, :from_module]
Group
```
