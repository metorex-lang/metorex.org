---
title: "syntax/adjacent_string_literals.rb"
slug: syntax-adjacent-string-literals
description: "The metorex example program syntax/adjacent_string_literals.rb and its output."
---

`tests/_examples/syntax/adjacent_string_literals.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/adjacent_string_literals.rb).

```metorex
# String literals written next to each other are one string, with any
# interpolation in them kept.
count = 3
p("a" "b")
p("a" "#{count}")
p("#{count}" "b", count)
p("a" "#{count}" 'c', count)
p('x' "#{count * 2}" "y" "#{count}")
long = "first part, " \
  "second part #{count}"
p(long)
```

Output:

```
"ab"
"a3"
"3b"
3
"a3c"
3
"x6y3"
"first part, second part 3"
```
