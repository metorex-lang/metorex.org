---
title: "introspection/method_shapes_no_parens.rb"
slug: introspection-method-shapes-no-parens
description: "The metorex example program introspection/method_shapes_no_parens.rb and its output."
---

`tests/_examples/introspection/method_shapes_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/method_shapes_no_parens.rb){target=_blank rel=noopener}.

```metorex
# What a Method object reports about the method it stands for.
module Greetings
  def hello(name)
    "hello #{name}"
  end
end

class Greeter
  include Greetings

  def greet(name, greeting = "Hi", *rest, punctuation:, times: 1, **options, &block)
    greeting
  end
end

greet = Greeter.new.method :greet
unbound_greet = Greeter.instance_method :greet
hello = Greeter.new.method :hello

p greet.parameters
p greet.arity
p unbound_greet.arity
p hello.owner
p hello.super_method

class Loud < Greeter
  def greet(name)
    super
  end
end

louder = Loud.new.method :greet
unbound_louder = Loud.instance_method :greet
p louder.super_method.owner
p unbound_louder.super_method.owner
p Object.new.method(:frozen?).super_method

loose = proc { |a, b = 1| }
strict = lambda { |a, b = 1| }
keyworded = proc { |a, k:, **rest| }
shaped = lambda { |a, k:, **rest| }

p loose.arity
p strict.arity
p keyworded.arity
p shaped.parameters
```

Output:

```
[[:req, :name], [:opt, :greeting], [:rest, :rest], [:keyreq, :punctuation], [:key, :times], [:keyrest, :options], [:block, :block]]
-3
-3
Greetings
nil
Greeter
Greeter
nil
1
-2
2
[[:req, :a], [:keyreq, :k], [:keyrest, :rest]]
```
