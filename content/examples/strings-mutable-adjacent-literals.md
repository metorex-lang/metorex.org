---
title: "strings/mutable_adjacent_literals.rb"
slug: strings-mutable-adjacent-literals
description: "The metorex example program strings/mutable_adjacent_literals.rb and its output."
---

`tests/_examples/strings/mutable_adjacent_literals.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/mutable_adjacent_literals.rb).

```metorex
# frozen_string_literal: false

joined = "maintenance window " \
  "moves to 02:00"
joined << "."
p(joined)
hour = 2
p("window " "at #{hour}:00")
```

Output:

```
"maintenance window moves to 02:00."
"window at 2:00"
```
