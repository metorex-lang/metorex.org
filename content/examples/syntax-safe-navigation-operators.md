---
title: "syntax/safe_navigation_operators.rb"
slug: syntax-safe-navigation-operators
description: "The metorex example program syntax/safe_navigation_operators.rb and its output."
---

`tests/_examples/syntax/safe_navigation_operators.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/safe_navigation_operators.rb){target=_blank rel=noopener}.

```metorex
# `&.` reaches `[]`, `[]=` and `.()` written as method names, and answers
# nil without calling them when the receiver is nil.
prices = { tea: 3 }
p(prices&.[](:tea))
p(prices&.[]=(:coffee, 4))
p(prices)

double = ->(amount) { amount * 2 }
p(double&.(5))

missing = nil
p(missing&.[](:tea))
p(missing&.[]=(:tea, 1))
p(missing&.(5))
p(missing&.[](:tea) || :none)
```

Output:

```
3
4
{tea: 3, coffee: 4}
10
nil
nil
nil
:none
```
