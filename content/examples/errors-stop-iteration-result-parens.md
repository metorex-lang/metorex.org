---
title: "errors/stop_iteration/result_parens.rb"
slug: errors-stop-iteration-result-parens
description: "The metorex example program errors/stop_iteration/result_parens.rb and its output."
---

`tests/_examples/errors/stop_iteration/result_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/stop_iteration/result_parens.rb){target=_blank rel=noopener}.

```metorex
class Countdown
  def each
    yield 3
    yield 2
    yield 1
    :liftoff
  end
end

enumerator = Countdown.new.to_enum

puts(enumerator.next)
puts(enumerator.next)
puts(enumerator.next)

begin
  enumerator.next
rescue StopIteration => error
  puts(error.message)
  p error.result
end

enumerator.rewind
puts(enumerator.next)

class NoReturnValue
  def each
    yield :only
    nil
  end
end

exhausted = NoReturnValue.new.to_enum
exhausted.next

begin
  exhausted.next
rescue StopIteration => error
  p error.result
end

p(StopIteration.new("built by hand").result)
```

Output:

```
3
2
1
iteration reached an end
:liftoff
3
nil
nil
```
