---
title: "parser/trailing_binary_ampersand.rb"
slug: parser-trailing-binary-ampersand
description: "The metorex example program parser/trailing_binary_ampersand.rb and its output."
---

`tests/_examples/parser/trailing_binary_ampersand.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/parser/trailing_binary_ampersand.rb).

```metorex
a = 6 &
  3
p a
b = [1, 2] &
  [2]
p b
def m(x) = x
c = m(5) |
  2
p c
d = m(5).succ &
  m(3)
p d
```

Output:

```
2
[2]
7
2
```
