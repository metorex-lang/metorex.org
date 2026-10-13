---
title: "introspection/class_of_class.rb"
slug: introspection-class-of-class
description: "The metorex example program introspection/class_of_class.rb and its output."
---

`tests/_examples/introspection/class_of_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/class_of_class.rb).

```metorex
module Greeting
end

class Greeter
end

puts String.class
puts BasicObject.class
puts Greeter.class
puts Class.class
puts Module.class
puts Greeting.class
puts Greeter.new.class

puts String.class.equal? Class
puts Greeting.class.equal?(Module)
```

Output:

```
Class
Class
Class
Class
Class
Module
Greeter
true
true
```
