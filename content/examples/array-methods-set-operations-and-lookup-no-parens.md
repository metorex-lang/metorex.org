---
title: "array_methods/set_operations_and_lookup_no_parens.rb"
slug: array-methods-set-operations-and-lookup-no-parens
description: "The metorex example program array_methods/set_operations_and_lookup_no_parens.rb and its output."
---

`tests/_examples/array_methods/set_operations_and_lookup_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/set_operations_and_lookup_no_parens.rb).

```metorex
letters = [:a, :b, :b, :c]
p letters.union [:c, :d]
p letters.intersection [:b, :c, :e]
p letters.difference [:b]
p letters.union
p([1, 2] + [3])
p([1, 2, 2, 3] - [2])
p([1, 2] | [2, 3])
p([1, 2, 3] & [2, 3, 4])
p([1, 2] * 3)
p([1, 2] * ", ")

p([1, 2] <=> [1, 3])
p([1, 2] <=> [1, 2, 3])
p([1, 2] <=> [1, "two"])

pairs = [[:one, 1], [:two, 2]]
p pairs.assoc :two
p pairs.rassoc 1
p pairs.assoc :missing

numbers = [10, 20, 30, 40]
p numbers.fetch 1
p numbers.fetch -1
p numbers.fetch 9, :none
p numbers.fetch(9) { |index| index * 2 }
p numbers.fetch_values 0, 2
p numbers.values_at 0, 2..3
p numbers.values_at(1..)
p numbers.values_at(..1)
p numbers.values_at 9

begin
  numbers.fetch 9
rescue IndexError => error
  puts error.message
end

p numbers.first 2
p numbers.last 2
p numbers.min
p numbers.max
p numbers.minmax
p numbers.max { |left, right| right <=> left }

stack = [1, 2, 3, 4]
p stack.pop 2
p stack.shift 1
p stack
p stack.insert 0, :front
p stack.insert -1, :back

grid = [[1, 2], [3, 4]]
p grid.transpose
begin
  [[1, 2], [3]].transpose
rescue IndexError => error
  puts error.message
end

p [1, 2].zip [3, 4], [5, 6]
p [1, 2, 3].replace [:x]

begin
  [].first 2**70
rescue RangeError => error
  puts error.class
end
```

Output:

```
[:a, :b, :c, :d]
[:b, :c]
[:a, :c]
[:a, :b, :c]
[1, 2, 3]
[1, 3]
[1, 2, 3]
[2, 3]
[1, 2, 1, 2, 1, 2]
"1, 2"
-1
-1
nil
[:two, 2]
[:one, 1]
nil
20
40
:none
18
[10, 30]
[10, 30, 40]
[20, 30, 40]
[10, 20]
[nil]
index 9 outside of array bounds: -4...4
[10, 20]
[30, 40]
10
40
[10, 40]
10
[3, 4]
[1]
[2]
[:front, 2]
[:front, 2, :back]
[[1, 3], [2, 4]]
element size differs (1 should be 2)
[[1, 3, 5], [2, 4, 6]]
[:x]
RangeError
```
