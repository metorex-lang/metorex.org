---
title: "strings/frozen_adjacent_literals_no_parens.rb"
slug: strings-frozen-adjacent-literals-no-parens
description: "The metorex example program strings/frozen_adjacent_literals_no_parens.rb and its output."
---

`tests/_examples/strings/frozen_adjacent_literals_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/frozen_adjacent_literals_no_parens.rb).

```metorex
# frozen_string_literal: true

def note text, category:
  [text, category]
end

joined = "maintenance window " \
  "moves to 02:00"
p joined
p joined.frozen?
p note "rates load " \
       "from the cache",
       category: :deprecated
hour = 2
p "window " "at #{hour}:00"
p ("window " "at #{hour}:00").frozen?
p "at #{hour}:00" " sharp"
```

Output:

```
"maintenance window moves to 02:00"
true
["rates load from the cache", :deprecated]
"window at 2:00"
false
"at 2:00 sharp"
```
