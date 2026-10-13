---
title: "errors/message/dispatch_parens.rb"
slug: errors-message-dispatch-parens
description: "The metorex example program errors/message/dispatch_parens.rb and its output."
---

`tests/_examples/errors/message/dispatch_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/message/dispatch_parens.rb){target=_blank rel=noopener}.

```metorex
class Described < StandardError
  def to_s
    "this is from to_s"
  end
end

class Quiet < StandardError
end

puts(Exception.new.message)
puts(Exception.new("Ouch!").message)
puts(Described.new("you will not see this").message)
puts(Quiet.new.message)
puts(Quiet.new("plain").message)

error = Exception.new
def error.to_s
  "from a singleton"
end
puts(error.message)

raised = begin
  raise Described
rescue => caught
  caught
end
puts(raised.message)
```

Output:

```
Exception
Ouch!
this is from to_s
Quiet
plain
from a singleton
this is from to_s
```
