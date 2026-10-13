---
title: "basics/float_division.rb"
slug: basics-float-division
description: "The metorex example program basics/float_division.rb and its output."
---

`tests/_examples/basics/float_division.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/float_division.rb).

```metorex
puts 1 / 0.0
puts(-1 / 0.0)
puts 0 / 0.0
puts 1.0 / 0
puts 1.0 / 0.0
puts 4.0 / 2

begin
  1 / 0
rescue ZeroDivisionError, RuntimeError => e
  puts "integer division raises"
end
```

Output:

```
Infinity
-Infinity
NaN
Infinity
Infinity
2.0
integer division raises
```
