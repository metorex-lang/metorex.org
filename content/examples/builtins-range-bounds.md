---
title: "builtins/range_bounds.rb"
slug: builtins-range-bounds
description: "The metorex example program builtins/range_bounds.rb and its output."
---

`tests/_examples/builtins/range_bounds.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/range_bounds.rb).

```metorex
# A range answers by comparing against its ends, and a range of names is read
# one place at a time.
p((0..5).cover?(2))
p((0.5..2.4).include?(2))
p(("C".."X").member?("M"))
p(("B"..."W").member?("W"))
p(("a".."f").include?("ga"))

p((0..10).cover?(0...11))
p((0...10).cover?(0..10))
p((..10).cover?(...10))
p((0..10).cover?(...10))

begin
  (false..true)
rescue ArgumentError => error
  p(error.message)
end
```

Output:

```
true
true
true
false
false
true
false
true
false
"bad value for range"
```
