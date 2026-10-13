---
title: "metaprogramming/define_method_lambda_control_flow_no_parens.rb"
slug: metaprogramming-define-method-lambda-control-flow-no-parens
description: "The metorex example program metaprogramming/define_method_lambda_control_flow_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/define_method_lambda_control_flow_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/define_method_lambda_control_flow_no_parens.rb).

```metorex
breaker = Class.new do
  define_method :foo do
    break 42
  end
end
puts breaker.new.foo.inspect

skipper = Class.new do
  define_method :foo do
    next 42
  end
end
puts skipper.new.foo.inspect

retrying = Class.new do
  seen = []
  define_method :foo do
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
```

Output:

```
42
42
[:first, :second]
```
