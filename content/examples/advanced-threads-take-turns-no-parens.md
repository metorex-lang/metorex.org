---
title: "advanced/threads_take_turns_no_parens.rb"
slug: advanced-threads-take-turns-no-parens
description: "The metorex example program advanced/threads_take_turns_no_parens.rb and its output."
---

`tests/_examples/advanced/threads_take_turns_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/threads_take_turns_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A thread hands the turn over once it has run for a time slice, however
# few statements that took, so a counting thread advances while another
# works through slow ones.
count = 0
counter = Thread.new { loop { count += 1 } }
Thread.pass while count.zero?

seen = count
rounds = 0
until count > seen
  7**300_000
  rounds += 1
end
counter.kill

p rounds.positive?
p rounds < 1000
```

Output:

```
true
true
```
