---
title: "advanced/implicit_block_capture.rb"
slug: advanced-implicit-block-capture
description: "The metorex example program advanced/implicit_block_capture.rb and its output."
---

`tests/_examples/advanced/implicit_block_capture.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/implicit_block_capture.rb).

```metorex
def custom_wrapper(name, block)
  puts "Starting: #{name}"

  block.call

  puts "Finished: #{name}"
end

custom_wrapper "Network Fetch" do
  Network.fetch "data.json"
end
```
