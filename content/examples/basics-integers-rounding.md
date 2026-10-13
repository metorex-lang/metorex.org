---
title: "basics/integers/rounding.rb"
slug: basics-integers-rounding
description: "The metorex example program basics/integers/rounding.rb and its output."
---

`tests/_examples/basics/integers/rounding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/integers/rounding.rb){target=_blank rel=noopener}.

```metorex
# A precision of zero or more leaves an Integer alone, since it has no digits
# to drop.
p 15.ceil
p 15.ceil 0
p 15.ceil 42
p 15.floor 1

# A negative precision rounds to that power of ten, each method sending a
# value between two multiples its own way.
p 15.ceil -1
p 15.floor -1
p 15.truncate -1
p(-15.truncate(-1))
p(-15.floor(-1))
p 249.round -2
p 250.round -2

# `half:` names where a value exactly between two multiples goes.
p 25.round -1, half: :up
p 25.round -1, half: :down
p 25.round -1, half: :even
p 35.round -1, half: :even
p(-25.round(-1, half: :up))
p(-25.round(-1, half: :down))

begin
  42.round -1, half: :foo
rescue ArgumentError => error
  puts error.message
end

# A sign glued to a numeric literal belongs to the literal.
p(-1.abs)
p(-2 ** 2)
p(+249.round(-2))
```

Output:

```
15
15
15
15
20
10
10
-10
-20
200
300
30
20
20
40
-30
-20
invalid rounding mode: foo
1
-4
200
```
