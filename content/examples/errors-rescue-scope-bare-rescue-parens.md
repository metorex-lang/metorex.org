---
title: "errors/rescue_scope/bare_rescue_parens.rb"
slug: errors-rescue-scope-bare-rescue-parens
description: "The metorex example program errors/rescue_scope/bare_rescue_parens.rb and its output."
---

`tests/_examples/errors/rescue_scope/bare_rescue_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/rescue_scope/bare_rescue_parens.rb).

```metorex
def caught_by_bare_rescue
  yield
  :nothing_raised
rescue
  :caught
end

puts(caught_by_bare_rescue { raise(StandardError) })
puts(caught_by_bare_rescue { raise(RuntimeError) })
puts(caught_by_bare_rescue { raise(ArgumentError) })

class OwnError < StandardError
end

puts(caught_by_bare_rescue { raise(OwnError) })

module Nested
  class DeepError < StandardError
  end
end

puts(caught_by_bare_rescue { raise(Nested::DeepError) })

anonymous = Class.new(StandardError)
puts(caught_by_bare_rescue { raise(anonymous) })

begin
  caught_by_bare_rescue { raise(Exception) }
rescue Exception => error
  puts(error.class)
end

begin
  begin; raise(Exception); rescue; end
  puts(:unreachable)
rescue Exception => error
  puts("passed the bare rescue")
end
```

Output:

```
caught
caught
caught
caught
caught
caught
Exception
passed the bare rescue
```
