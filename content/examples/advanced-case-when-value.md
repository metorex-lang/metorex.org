---
title: "advanced/case_when_value.rb"
slug: advanced-case-when-value
description: "The metorex example program advanced/case_when_value.rb and its output."
---

`tests/_examples/advanced/case_when_value.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/case_when_value.rb){target=_blank rel=noopener}.

```metorex
# case/when as last statement in method body should return value via ControlFlow::Value
def grade(score)
  case score
  when 90..100
    "A"
  when 80..89
    "B"
  when 70..79
    "C"
  else
    "F"
  end
end
puts grade(95)
puts grade(82)
puts grade(75)
puts grade(50)
```

Output:

```
A
B
C
F
```
