---
title: "metaprogramming/define_method_lambda_control_flow.rb"
slug: metaprogramming-define-method-lambda-control-flow
description: "The metorex example program metaprogramming/define_method_lambda_control_flow.rb and its output."
---

`tests/_examples/metaprogramming/define_method_lambda_control_flow.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/define_method_lambda_control_flow.rb){target=_blank rel=noopener}.

```metorex
puts Class.new { define_method(:foo) { return 42 } }.new.foo.inspect
puts Class.new { define_method(:foo) { break 42 } }.new.foo.inspect
puts Class.new { define_method(:foo) { next 42 } }.new.foo.inspect

retrying = Class.new do
  seen = []
  define_method(:foo) do
    if seen.empty?
      seen << :first
      redo
    else
      seen << :second
      seen
    end
  end
end
puts retrying.new.foo.inspect

# A trailing comma makes a Proc destructure a lone array argument; the method
# built from the same block keeps the plain single-parameter arity.
puts proc { |first,| first }.call([1, 2]).inspect
puts Class.new { define_method(:m) { |first,| first } }.new.m([1, 2]).inspect
```

Output:

```
42
42
42
[:first, :second]
1
[1, 2]
```
