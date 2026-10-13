---
title: "callables/proc_written_at_no_parens.rb"
slug: callables-proc-written-at-no-parens
description: "The metorex example program callables/proc_written_at_no_parens.rb and its output."
---

`tests/_examples/callables/proc_written_at_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/proc_written_at_no_parens.rb).

```metorex
# A block written in the main script names that script the way it was given
# on the command line, as `__FILE__` does.

written = proc { :inside }
p written.source_location[0] == __FILE__
p written.inspect.include?("#{__FILE__}:4")
```

Output:

```
true
true
```
