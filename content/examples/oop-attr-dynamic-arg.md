---
title: "oop/attr/dynamic_arg.rb"
slug: oop-attr-dynamic-arg
description: "The metorex example program oop/attr/dynamic_arg.rb and its output."
---

`tests/_examples/oop/attr/dynamic_arg.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/attr/dynamic_arg.rb).

```metorex
class StringLike
  def to_str; "test"; end
end

o = StringLike.new
c = Class.new { attr o }
inst = c.new
inst.instance_variable_set(:@test, "hello")
puts inst.respond_to?("test")
puts inst.test
```

Output:

```
true
hello
```
