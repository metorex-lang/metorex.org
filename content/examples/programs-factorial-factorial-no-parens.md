---
title: "programs/factorial/factorial_no_parens.rb"
slug: programs-factorial-factorial-no-parens
description: "The metorex example program programs/factorial/factorial_no_parens.rb and its output."
---

`tests/_examples/programs/factorial/factorial_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/programs/factorial/factorial_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Factorial without parentheses (where possible)

def factorial_iterative(n)
  if n <= 1
    return 1
  end
  result = 1
  for i in 2..n
    result *= i
  end
  result
end

def factorial_recursive(n)
  if n <= 1
    return 1
  end
  n * factorial_recursive(n - 1)
end

for n in 0..10
  iter = factorial_iterative n
  recur = factorial_recursive n
  puts "#{n}! = #{iter}"
end
```

Output:

```
0! = 1
1! = 1
2! = 2
3! = 6
4! = 24
5! = 120
6! = 720
7! = 5040
8! = 40320
9! = 362880
10! = 3628800
```
