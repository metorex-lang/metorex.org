---
title: "basics/scientific_notation.rb"
slug: basics-scientific-notation
description: "The metorex example program basics/scientific_notation.rb and its output."
---

`tests/_examples/basics/scientific_notation.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/scientific_notation.rb).

```metorex
puts 2e3
puts 2E3
puts 2e+3
puts 1.5e-3
puts 1e10.class
puts 2e3 + 1
puts(-2e3)

# A bare `e` with no digits after it is not part of the number.
e = 5
puts 2 * e
```

Output:

```
2000.0
2000.0
2000.0
0.0015
Float
2001.0
-2000.0
10
```
