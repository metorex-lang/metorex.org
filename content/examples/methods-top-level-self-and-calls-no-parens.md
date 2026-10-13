---
title: "methods/top_level_self_and_calls_no_parens.rb"
slug: methods-top-level-self-and-calls-no-parens
description: "The metorex example program methods/top_level_self_and_calls_no_parens.rb and its output."
---

`tests/_examples/methods/top_level_self_and_calls_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/top_level_self_and_calls_no_parens.rb).

```metorex
# A method written at the top level runs with `main` as `self`, however it
# is called, and a call written with parentheses reaches the method even
# where a local of the same name exists.
def whoami
  self
end

p whoami
p whoami()
p method(:whoami).call
p method(:whoami).receiver

class Caller
  def ask = whoami
end
p Caller.new.ask.class

def label = :method
label = "local"
p label
p label()

count = 3
begin
  count()
rescue NoMethodError => error
  puts error.message
end

format = 5
p format("%03d", 7)
p format
```

Output:

```
main
main
main
main
Caller
"local"
:method
undefined method 'count' for main
"007"
5
```
