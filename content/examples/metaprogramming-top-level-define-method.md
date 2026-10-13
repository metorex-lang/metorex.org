---
title: "metaprogramming/top_level_define_method.rb"
slug: metaprogramming-top-level-define-method
description: "The metorex example program metaprogramming/top_level_define_method.rb and its output."
---

`tests/_examples/metaprogramming/top_level_define_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/top_level_define_method.rb).

```metorex
eval("define_method(:boom) { :bam }", TOPLEVEL_BINDING)
puts Object.new.methods.include?(:boom)
result = eval("define_method(:boing) { :bong }", TOPLEVEL_BINDING)
puts result
Object.send(:remove_method, :boom)
Object.send(:remove_method, :boing)
puts Object.new.methods.include?(:boom)
puts Object.new.methods.include?(:boing)
```

Output:

```
true
boing
false
false
```
