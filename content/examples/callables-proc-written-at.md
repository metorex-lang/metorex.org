---
title: "callables/proc_written_at.rb"
slug: callables-proc-written-at
description: "The metorex example program callables/proc_written_at.rb and its output."
---

`tests/_examples/callables/proc_written_at.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/proc_written_at.rb).

```metorex
# A block written in the main script names that script the way it was given
# on the command line, as `__FILE__` does.

written = proc { :inside }
p(written.source_location[0] == __FILE__)
p(written.inspect.include?("#{__FILE__}:4"))
```

Output:

```
true
true
```
