---
title: "metaprogramming/class_exec_captured_local_named_like_a_function.rb"
slug: metaprogramming-class-exec-captured-local-named-like-a-function
description: "The metorex example program metaprogramming/class_exec_captured_local_named_like_a_function.rb and its output."
---

`tests/_examples/metaprogramming/class_exec_captured_local_named_like_a_function.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_exec_captured_local_named_like_a_function.rb).

```metorex
class Group
  def self.describe(&block)
    Class.new(self).class_exec(&block)
  end

  def self.it(&block)
    (@examples ||= []) << block
    new.instance_exec(&block)
  end
end

[:be_a, :be_an].each do |method|
  Group.describe do
    it { p send(method, 1) rescue p $! }
    it { p method }
  end
end
```

Output:

```
#<NoMethodError: undefined method 'be_a' for an instance of #<Class:0x00000077adc76c10>>
:be_a
#<NoMethodError: undefined method 'be_an' for an instance of #<Class:0x00000077adc77010>>
:be_an
```
