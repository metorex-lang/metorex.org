---
title: "eval/binding_in_module_eval_no_parens.rb"
slug: eval-binding-in-module-eval-no-parens
description: "The metorex example program eval/binding_in_module_eval_no_parens.rb and its output."
---

`tests/_examples/eval/binding_in_module_eval_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/eval/binding_in_module_eval_no_parens.rb).

```metorex
# A `def` run through a binding taken inside a `module_eval` block lands on
# the module the block opened, even when a method of another class runs the
# block, which is how ERB#def_method defines its method.
require "erb"

class Maker
  def define_on(target, source)
    target.module_eval { eval(source, binding) }
  end
end

class Target; end
Maker.new.define_on(Target, "def answer = 42")
p Target.instance_methods(false)
p Maker.instance_methods(false)
p Target.new.answer

class Page; end
ERB.new("<%= 1 + 1 %> items\n").def_method(Page, "render()")
p Page.new.render
```

Output:

```
[:answer]
[:define_on]
42
"2 items\n"
```
