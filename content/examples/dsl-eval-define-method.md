---
title: "dsl/eval_define_method.rb"
slug: dsl-eval-define-method
description: "The metorex example program dsl/eval_define_method.rb and its output."
---

`tests/_examples/dsl/eval_define_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dsl/eval_define_method.rb){target=_blank rel=noopener}.

```metorex
code = 'define_method(:boom) { :bam }'
result = eval code, TOPLEVEL_BINDING
puts "eval result: #{result.inspect}"

methods = Object.methods(true)
puts "Object has boom? #{methods.include?(:boom)}"

# Try calling it
begin
  puts "calling: #{boom.inspect}"
rescue NoMethodError => e
  puts "no boom: #{e.message}"
end
```

Output:

```
eval result: :boom
Object has boom? true
calling: :bam
```
