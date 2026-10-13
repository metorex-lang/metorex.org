---
title: "programs/fizzbuzz/fizzbuzz.rb"
slug: programs-fizzbuzz-fizzbuzz
description: "The metorex example program programs/fizzbuzz/fizzbuzz.rb and its output."
---

`tests/_examples/programs/fizzbuzz/fizzbuzz.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/programs/fizzbuzz/fizzbuzz.rb){target=_blank rel=noopener}.

```metorex
# FizzBuzz: Classic programming challenge
# Print numbers 1-20, replacing multiples of 3 with "Fizz",
# multiples of 5 with "Buzz", and multiples of both with "FizzBuzz"

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
