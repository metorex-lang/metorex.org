---
title: "object_space/gc_answers_object_methods_no_parens.rb"
slug: object-space-gc-answers-object-methods-no-parens
description: "The metorex example program object_space/gc_answers_object_methods_no_parens.rb and its output."
---

`tests/_examples/object_space/gc_answers_object_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/object_space/gc_answers_object_methods_no_parens.rb).

```metorex
# A method the program defines on Object is one GC and ObjectSpace answer
# too, as every object does, while a name neither module keeps an account of
# still reads as nil.
class Object
  def described_by_program
    "answered for #{inspect}"
  end
end

p GC.described_by_program
p ObjectSpace.described_by_program
p GC.respond_to? :described_by_program
```

Output:

```
"answered for GC"
"answered for ObjectSpace"
true
```
