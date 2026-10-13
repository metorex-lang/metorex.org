---
title: "control_flow/case_multi_when.rb"
slug: control-flow-case-multi-when
description: "The metorex example program control_flow/case_multi_when.rb and its output."
---

`tests/_examples/control_flow/case_multi_when.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_multi_when.rb).

```metorex
def classify(n)
  case n
  when 1, 2, 3 then "small"
  when 4, 5, 6 then "medium"
  when 7, 8, 9 then "large"
  else "other"
  end
end

puts classify(1)
puts classify(3)
puts classify(5)
puts classify(8)
puts classify(100)
```

Output:

```
small
small
medium
large
other
```
