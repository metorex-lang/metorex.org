---
title: "errors/abort_uncaught.rb"
slug: errors-abort-uncaught
description: "The metorex example program errors/abort_uncaught.rb and its output."
---

`tests/_examples/errors/abort_uncaught.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/abort_uncaught.rb).

```metorex
class Capture
  def write(text)
    puts "captured: #{text}"
  end
end

$stderr = Capture.new

abort "redirected message"

puts "never reached"
```
