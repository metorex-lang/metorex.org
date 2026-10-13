---
title: "methods/default_params/method_parens.rb"
slug: methods-default-params-method-parens
description: "The metorex example program methods/default_params/method_parens.rb and its output."
---

`tests/_examples/methods/default_params/method_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/default_params/method_parens.rb){target=_blank rel=noopener}.

```metorex
class Greeter
  def greet(name, greeting = "Hello")
    puts greeting + ", " + name
  end
end

g = Greeter.new
g.greet "Alice"
g.greet("Bob", "Hi")
```

Output:

```
Hello, Alice
Hi, Bob
```
