---
title: "backtraces/chained_call_line.rb"
slug: backtraces-chained-call-line
description: "The metorex example program backtraces/chained_call_line.rb and its output."
---

`tests/_examples/backtraces/chained_call_line.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/chained_call_line.rb){target=_blank rel=noopener}.

```metorex
def fail_here(*)
  raise ArgumentError, "from the chain"
end

def line_of_failure
  yield
rescue ArgumentError => error
  error.backtrace_locations.find { |location| location.label.include?("block") || location.label == "<main>" }&.lineno
end

p(line_of_failure do
  [1, 2]
    .map { |value| value * 2 }
    .then { |values| fail_here(values) }
end)

p(line_of_failure do
  proc {
    :held
  }.call.then { fail_here }
end)

p(line_of_failure do
  fail_here(
    1,
    2
  )
end)

class Proc
  def fail_after(*)
    raise ArgumentError, "from the method the chain called"
  end
end

p(line_of_failure do
  proc {
    :held
  }.fail_after(:argument)
end)

p(line_of_failure do
  proc {
    :held
  }.fail_after proc { :other }
end)
```

Output:

```
14
20
24
39
45
```
