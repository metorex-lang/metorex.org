---
title: "array_methods/rfind_no_parens.rb"
slug: array-methods-rfind-no-parens
description: "The metorex example program array_methods/rfind_no_parens.rb and its output."
---

`tests/_examples/array_methods/rfind_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/rfind_no_parens.rb).

```metorex
# `rfind` reads an array from the end, `Method#box` names no namespace while
# namespaces are off, and the core classes built natively descend from
# Object and through it from Kernel and BasicObject.
p [1, 2, 3].rfind { |number| number < 3 }
p [1, 2, 3].rfind(-> { :none }) { |number| number > 5 }
p [1, 2].rfind.to_a
shrinking = [1, 2, 3, 4]
p shrinking.rfind { shrinking.pop; false }

def answer = 42
p method(:answer).box
p 1.method(:+).box

p Time.ancestors
p Thread.ancestors
p Thread::Mutex.ancestors
```

Output:

```
2
:none
[2, 1]
nil
nil
nil
[Time, Comparable, Object, Kernel, BasicObject]
[Thread, Object, Kernel, BasicObject]
[Thread::Mutex, Object, Kernel, BasicObject]
```
