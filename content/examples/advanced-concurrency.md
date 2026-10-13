---
title: "advanced/concurrency.rb"
slug: advanced-concurrency
description: "The metorex example program advanced/concurrency.rb and its output."
---

`tests/_examples/advanced/concurrency.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/concurrency.rb){target=_blank rel=noopener}.

```metorex
channel = Channel.new

def expensive_computation()
  sleep 1
end

thread = Thread.new do
  result = expensive_computation()
  channel.send(result)
end

result = channel.receive
puts "Got result: #{result}"
```
