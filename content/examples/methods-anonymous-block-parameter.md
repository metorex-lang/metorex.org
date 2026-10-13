---
title: "methods/anonymous_block_parameter.rb"
slug: methods-anonymous-block-parameter
description: "The metorex example program methods/anonymous_block_parameter.rb and its output."
---

`tests/_examples/methods/anonymous_block_parameter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/anonymous_block_parameter.rb).

```metorex
def run_it(&block)
  block.call
end

def forwards(&)
  run_it(&)
end

def forwards_with_arguments(label, &)
  "#{label}: #{run_it(&)}"
end

class Relay
  def deliver(&)
    collect(&)
  end

  def collect(&block)
    block.call * 2
  end
end

puts forwards { "plain" }
puts forwards_with_arguments("labeled") { "value" }
puts Relay.new.deliver { 21 }
```

Output:

```
plain
labeled: value
42
```
