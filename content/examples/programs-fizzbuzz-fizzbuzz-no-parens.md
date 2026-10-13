---
title: "programs/fizzbuzz/fizzbuzz_no_parens.rb"
slug: programs-fizzbuzz-fizzbuzz-no-parens
description: "The metorex example program programs/fizzbuzz/fizzbuzz_no_parens.rb and its output."
---

`tests/_examples/programs/fizzbuzz/fizzbuzz_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/programs/fizzbuzz/fizzbuzz_no_parens.rb).

```metorex
# FizzBuzz without parentheses
for i in 1..20
  if i % 15 == 0
    puts "FizzBuzz"
  elsif i % 3 == 0
    puts "Fizz"
  elsif i % 5 == 0
    puts "Buzz"
  else
    puts i
  end
end
```

Output:

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
```
