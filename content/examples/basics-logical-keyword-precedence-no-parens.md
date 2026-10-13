---
title: "basics/logical_keyword_precedence_no_parens.rb"
slug: basics-logical-keyword-precedence-no-parens
description: "The metorex example program basics/logical_keyword_precedence_no_parens.rb and its output."
---

`tests/_examples/basics/logical_keyword_precedence_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/logical_keyword_precedence_no_parens.rb).

```metorex
# `and` and `or` bind more loosely than an assignment, so each side is
# assigned in turn.
first = nil
second = nil
first = 1 and second = 2
p [first, second]

third = false
fourth = nil
third = false or fourth = 7
p [third, fourth]

# A single-quoted string reads only a backslash and a quote as escapes.
held = '\n\t'
p held.length
p held.bytes

# A safe call writes as well as reads, and does neither without a receiver.
class Holder
  attr_accessor :name
end

holder = Holder.new
p (holder&.name = "set")
p holder.name

missing = nil
p (missing&.name = "unset")
p missing

# `break` inside a lambda ends the lambda.
p -> { break 5 }.call
```

Output:

```
[1, 2]
[false, 7]
4
[92, 110, 92, 116]
"set"
"set"
nil
nil
5
```
