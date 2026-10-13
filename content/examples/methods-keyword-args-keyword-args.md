---
title: "methods/keyword_args/keyword_args.rb"
slug: methods-keyword-args-keyword-args
description: "The metorex example program methods/keyword_args/keyword_args.rb and its output."
---

`tests/_examples/methods/keyword_args/keyword_args.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/keyword_args/keyword_args.rb).

```metorex
def greet(name:, greeting: "Hello")
  puts "#{greeting}, #{name}!"
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
