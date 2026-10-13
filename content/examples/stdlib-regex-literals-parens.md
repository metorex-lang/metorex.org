---
title: "stdlib/regex/literals_parens.rb"
slug: stdlib-regex-literals-parens
description: "The metorex example program stdlib/regex/literals_parens.rb and its output."
---

`tests/_examples/stdlib/regex/literals_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/regex/literals_parens.rb){target=_blank rel=noopener}.

```metorex
r = /hello/
puts(r)

r2 = /world/i
puts(r2)

a = 10
b = a / 2
puts(b)

r3 = /[a-z]+\d+/
puts(r3)

r4 = /hello\/world/
puts(r4)
```

Output:

```
(?-mix:hello)
(?i-mx:world)
5
(?-mix:[a-z]+\d+)
(?-mix:hello\/world)
```
