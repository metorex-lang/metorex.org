---
title: "builtins/operators_coverage_no_parens.rb"
slug: builtins-operators-coverage-no-parens
description: "The metorex example program builtins/operators_coverage_no_parens.rb and its output."
---

`tests/_examples/builtins/operators_coverage_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/operators_coverage_no_parens.rb).

```metorex
# Integer arithmetic past the word width stays exact (no parens where possible)
big = 4611686018427387903
puts big + big
puts big * 3
puts 0 - big - big - 2

# String comparisons
puts "abc" < "abd"
puts "abd" > "abc"
puts "abc" <= "abc"
puts "abc" >= "abc"
puts "abc" <= "abd"
puts "abd" >= "abc"

# Bitwise on integers
puts 5 & 3
puts 5 | 3
puts 5 ^ 3
```

Output:

```
9223372036854775806
13835058055282163709
-9223372036854775808
true
true
true
true
true
true
1
7
6
```
