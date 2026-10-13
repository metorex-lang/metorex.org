---
title: "runtime/loops.rb"
slug: runtime-loops
description: "The metorex example program runtime/loops.rb and its output."
---

`tests/_examples/runtime/loops.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/loops.rb).

```metorex
# Control Flow Examples - If/Else and While Loops

# ===========================
# If/Else Statements
# ===========================

# Simple if statement
x = 10
if x > 5
  result = "x is greater than 5"
end

# If with else
y = 3
if y > 5
  status = "large"
else
  status = "small"
end

# If with complex conditions
score = 85
if score >= 90
  grade = "A"
else
  grade = "B"
end

# ===========================
# While Loops
# ===========================

# Simple while loop - count to 5
counter = 0
while counter < 5
  counter = counter + 1
end

# While loop with accumulation
i = 1
sum = 0
while i <= 10
  sum = sum + i
  i = i + 1
end
```
