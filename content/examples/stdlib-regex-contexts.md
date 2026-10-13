---
title: "stdlib/regex/contexts.rb"
slug: stdlib-regex-contexts
description: "The metorex example program stdlib/regex/contexts.rb and its output."
---

`tests/_examples/stdlib/regex/contexts.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/regex/contexts.rb){target=_blank rel=noopener}.

```metorex
# Regex after assignment
x = /hello/
puts x

# Regex after comma (in array)
arr = [/foo/, /bar/i]
puts arr[0]
puts arr[1]

# Regex with character class
r = /[a-z]+/
puts r

# Regex with escaped slash
r2 = /path\/to\/file/
puts r2

# Division after value
a = 10
b = a / 2
puts b

# Division after parenthesized expression
c = (10 + 2) / 3
puts c

# Division after end keyword
def compute
  10
end
d = compute() / 2
puts d
```

Output:

```
(?-mix:hello)
(?-mix:foo)
(?i-mx:bar)
(?-mix:[a-z]+)
(?-mix:path\/to\/file)
5
4
5
```
