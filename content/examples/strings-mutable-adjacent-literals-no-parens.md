---
title: "strings/mutable_adjacent_literals_no_parens.rb"
slug: strings-mutable-adjacent-literals-no-parens
description: "The metorex example program strings/mutable_adjacent_literals_no_parens.rb and its output."
---

`tests/_examples/strings/mutable_adjacent_literals_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/mutable_adjacent_literals_no_parens.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: false

joined = "maintenance window " \
  "moves to 02:00"
joined << "."
p joined
hour = 2
p "window " "at #{hour}:00"
```

Output:

```
"maintenance window moves to 02:00."
"window at 2:00"
```
