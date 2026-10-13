---
title: "syntax/grouped_assignment_no_parens.rb"
slug: syntax-grouped-assignment-no-parens
description: "The metorex example program syntax/grouped_assignment_no_parens.rb and its output."
---

`tests/_examples/syntax/grouped_assignment_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/grouped_assignment_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A multiple assignment written inside a group answers its right-hand side.
p((a, b = 1, 2))
p [a, b]

p((first, second, third = 1))
p [first, second, third]

# `defined?` reports on an assignment without carrying it out.
p defined?(counted = 1)
p defined?(@held = 2)
p defined?($named = 3)
p defined?(counted %= 2)
held = []
p defined?(held[0] = 1)
p held
```

Output:

```
[1, 2]
[1, 2]
1
[1, nil, nil]
"assignment"
"assignment"
"assignment"
"assignment"
"method"
[]
```
