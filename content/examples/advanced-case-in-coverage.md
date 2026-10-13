---
title: "advanced/case_in_coverage.rb"
slug: advanced-case-in-coverage
description: "The metorex example program advanced/case_in_coverage.rb and its output."
---

`tests/_examples/advanced/case_in_coverage.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/case_in_coverage.rb).

```metorex
# Test case/in pattern matching in various contexts

# 1. case/in in a method body (covers execute_method_body ControlFlow::Value)
def match_num(x)
  case x
  in 1
    "one"
  in 2
    "two"
  end
end
puts match_num(1)
puts match_num(2)

# 2. case/in inside a block (covers execute_block_body ControlFlow::Value)
result = [1, 2].map do |n|
  case n
  in 1
    "one"
  in 2
    "two"
  end
end
puts result[0]
puts result[1]
```

Output:

```
one
two
one
two
```
