---
title: "methods/def/with_rescue_return.rb"
slug: methods-def-with-rescue-return
description: "The metorex example program methods/def/with_rescue_return.rb and its output."
---

`tests/_examples/methods/def/with_rescue_return.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/def/with_rescue_return.rb){target=_blank rel=noopener}.

```metorex
def parse_args(argv)
  result = []
  while entry = argv.shift
    result << entry
  end
  result
rescue => e
  puts "rescued: #{e}"
  []
end

out = parse_args(["a", "b", "c"])
puts out.inspect
puts out.empty?
```
