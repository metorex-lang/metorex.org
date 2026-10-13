---
title: "metaprogramming/class_exec_block_named_like_a_caller_local.rb"
slug: metaprogramming-class-exec-block-named-like-a-caller-local
description: "The metorex example program metaprogramming/class_exec_block_named_like_a_caller_local.rb and its output."
---

`tests/_examples/metaprogramming/class_exec_block_named_like_a_caller_local.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_exec_block_named_like_a_caller_local.rb){target=_blank rel=noopener}.

```metorex
class Group
  def self.context(&block)
    Class.new(self).class_exec(&block)
  end

  def self.with_wrapper(&block)
    context do
      module_exec(&block)
    end
  end

  with_wrapper { p [:ran, superclass.superclass] }
end

def run_in(klass, &block)
  value = :caller_local
  klass.class_exec(:argument) { |value| p value }
  p value
end
run_in(Class.new)
```

Output:

```
[:ran, Object]
:argument
:caller_local
```
