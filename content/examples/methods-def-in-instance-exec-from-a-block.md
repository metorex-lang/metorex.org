---
title: "methods/def_in_instance_exec_from_a_block.rb"
slug: methods-def-in-instance-exec-from-a-block
description: "The metorex example program methods/def_in_instance_exec_from_a_block.rb and its output."
---

`tests/_examples/methods/def_in_instance_exec_from_a_block.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/def_in_instance_exec_from_a_block.rb){target=_blank rel=noopener}.

```metorex
class Group
  def self.it(&block)
    (@blocks ||= []) << block
  end

  def self.blocks = @blocks
end

class Runner
  def around = yield

  def run(instance, block)
    around { around { instance.instance_exec(&block) } }
  end
end

Group.class_exec do
  it do
    eval %{def initialize(a:, b:); end}
  end
  it do
    def total = 5
  end
end

first = Group.new
Runner.new.run(first, Group.blocks[0])
second = Group.new
Runner.new.run(second, Group.blocks[1])
p([first.singleton_methods, second.singleton_methods, Group.instance_methods(false), Group.new.class])

object = Object.new
class << object
  def initialize = nil
end
p(object.singleton_methods)
```

Output:

```
[[:initialize], [:total], [], Group]
[:initialize]
```
