---
title: "dsl/object_method_call_chain.rb"
slug: dsl-object-method-call-chain
description: "The metorex example program dsl/object_method_call_chain.rb and its output."
---

`tests/_examples/dsl/object_method_call_chain.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dsl/object_method_call_chain.rb){target=_blank rel=noopener}.

```metorex
def have_method(name, include_super = true)
  "matcher for #{name.inspect}"
end

class Object
  def my_should(matcher)
    puts "matcher class: #{matcher.class}"
    puts "matcher value: #{matcher.inspect}"
  end
end

Object.my_should have_method :boom
```

Output:

```
matcher class: String
matcher value: "matcher for :boom"
```
