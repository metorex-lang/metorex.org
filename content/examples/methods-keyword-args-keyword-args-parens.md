---
title: "methods/keyword_args/keyword_args_parens.rb"
slug: methods-keyword-args-keyword-args-parens
description: "The metorex example program methods/keyword_args/keyword_args_parens.rb and its output."
---

`tests/_examples/methods/keyword_args/keyword_args_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/keyword_args/keyword_args_parens.rb){target=_blank rel=noopener}.

```metorex
def greet(name:, greeting: "Hello")
  puts("#{greeting}, #{name}!")
end

greet(name: "Alice")
greet(name: "Bob", greeting: "Hi")
greet(greeting: "Hey", name: "Carol")
```

Output:

```
Hello, Alice!
Hi, Bob!
Hey, Carol!
```
