---
title: "basics/radix_suffixes.rb"
slug: basics-radix-suffixes
description: "The metorex example program basics/radix_suffixes.rb and its output."
---

`tests/_examples/basics/radix_suffixes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/radix_suffixes.rb){target=_blank rel=noopener}.

```metorex
# A number written in another base carries the same `r` and `i` suffixes a
# decimal one does, and the value it stands for is the whole number it named.
p 0xffr
p 042r
p 0b1111r
p(-0xffr)

p 0xffi
p 042i
p 0b1110i

# A decimal with a fraction is exactly the fraction it was written as,
# rather than the binary float nearest it.
p 0.3r
p 0.0174532925199432957r

# A literal past what fits in a machine word keeps every digit.
p 1111111111111111111111111111111111111111111111r
```

Output:

```
(255/1)
(34/1)
(15/1)
(-255/1)
(0+255i)
(0+34i)
(0+14i)
(3/10)
(174532925199432957/10000000000000000000)
(1111111111111111111111111111111111111111111111/1)
```
