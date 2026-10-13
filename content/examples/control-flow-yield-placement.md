---
title: "control_flow/yield_placement.rb"
slug: control-flow-yield-placement
description: "The metorex example program control_flow/yield_placement.rb and its output."
---

`tests/_examples/control_flow/yield_placement.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/yield_placement.rb){target=_blank rel=noopener}.

```metorex
def hands_over
  yield(1)
end
puts(hands_over { |taken| taken * 2 })

["class Holder; yield; end", "module Held; yield; end", "1.times { yield }"].each do |source|
  begin
    eval(source)
    puts("no error")
  rescue SyntaxError => error
    puts(error.message.include?("Invalid yield").to_s)
  end
end
```

Output:

```
2
true
true
true
```
