---
title: "basics/simple_range.rb"
slug: basics-simple-range
description: "The metorex example program basics/simple_range.rb and its output."
---

`tests/_examples/basics/simple_range.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/simple_range.rb){target=_blank rel=noopener}.

```metorex
# Simple range test

# Test range display
r1 = 1..5
r2 = 1...5
puts r1
puts r2

# Test range to_a
puts r1.to_a()
puts r2.to_a()
```

Output:

```
1..5
1...5
1
2
3
4
5
1
2
3
4
```
