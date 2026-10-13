---
title: "programs/fibonacci/fibonacci_no_parens.rb"
slug: programs-fibonacci-fibonacci-no-parens
description: "The metorex example program programs/fibonacci/fibonacci_no_parens.rb and its output."
---

`tests/_examples/programs/fibonacci/fibonacci_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/programs/fibonacci/fibonacci_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Fibonacci sequence without parentheses (where possible)

def fibonacci_iterative(n)
  if n <= 1
    return n
  end

  a = 0
  b = 1
  for i in 2..n
    temp = b
    b = a + b
    a = temp
  end
  b
end

def fibonacci_recursive(n)
  if n <= 1
    return n
  end
  fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
end

puts "Iterative:"
for i in 0..9
  puts fibonacci_iterative i
end

puts "Recursive:"
for i in 0..9
  puts fibonacci_recursive i
end
```

Output:

```
Iterative:
0
1
1
2
3
5
8
13
21
34
Recursive:
0
1
1
2
3
5
8
13
21
34
```
