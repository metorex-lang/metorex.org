---
title: "builtins/operators_coverage.rb"
slug: builtins-operators-coverage
description: "The metorex example program builtins/operators_coverage.rb and its output."
---

`tests/_examples/builtins/operators_coverage.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/operators_coverage.rb){target=_blank rel=noopener}.

```metorex
# Integer arithmetic past the word width stays exact
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

# Custom == via method
class Eq
  def initialize(val)
    @val = val
  end

  def ==(other)
    @val == other.instance_variable_get(:@val)
  end
end

puts Eq.new(1) == Eq.new(1)
puts Eq.new(1) == Eq.new(2)

# Custom <=> via method
class Cmp
  include Comparable

  def initialize(val)
    @val = val
  end

  def <=>(other)
    @val <=> other.instance_variable_get(:@val)
  end
end

puts Cmp.new(1) < Cmp.new(2)
puts Cmp.new(2) > Cmp.new(1)
puts Cmp.new(1) <= Cmp.new(1)
puts Cmp.new(1) >= Cmp.new(1)
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
true
false
true
true
true
true
```
