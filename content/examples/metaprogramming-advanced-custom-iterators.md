---
title: "metaprogramming/advanced/custom_iterators.rb"
slug: metaprogramming-advanced-custom-iterators
description: "The metorex example program metaprogramming/advanced/custom_iterators.rb and its output."
---

`tests/_examples/metaprogramming/advanced/custom_iterators.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/advanced/custom_iterators.rb){target=_blank rel=noopener}.

```metorex
# Custom Iterators: Build iterator patterns using blocks
# Demonstrates: yield-like patterns, higher-order functions, closures

# Custom each_with_index using a counter
def each_with_index(array, &block)
  i = 0
  array.each do |item|
    block.call(item, i)
    i += 1
  end
end

puts "=== each_with_index ==="
each_with_index(["apple", "banana", "cherry"]) do |item, idx|
  puts "#{idx}: #{item}"
end

# Custom times iterator
def times(n, &block)
  i = 0
  while i < n
    block.call(i)
    i += 1
  end
end

puts ""
puts "=== times ==="
times(5) do |i|
  puts "Iteration #{i}"
end

# Custom reduce/fold
def reduce(array, initial, &block)
  acc = initial
  array.each do |item|
    acc = block.call(acc, item)
  end
  acc
end

puts ""
puts "=== reduce ==="
sum = reduce([1, 2, 3, 4, 5], 0) do |acc, n|
  acc + n
end
puts "Sum: #{sum}"

product = reduce([1, 2, 3, 4, 5], 1) do |acc, n|
  acc * n
end
puts "Product: #{product}"

# Custom flat_map
def flat_map(array, &block)
  result = []
  array.each do |item|
    mapped = block.call(item)
    mapped.each do |sub|
      result.push(sub)
    end
  end
  result
end

puts ""
puts "=== flat_map ==="
nested = [[1, 2], [3, 4], [5, 6]]
flattened = flat_map(nested) do |arr|
  arr
end
puts flattened

# Custom take_while
def take_while(array, &block)
  result = []
  done = false
  array.each do |item|
    if !done && block.call(item)
      result.push(item)
    else
      done = true
    end
  end
  result
end

puts ""
puts "=== take_while ==="
numbers = [2, 4, 6, 7, 8, 10]
evens = take_while(numbers) do |n|
  n % 2 == 0
end
puts evens
```

Output:

```
=== each_with_index ===
0: apple
1: banana
2: cherry

=== times ===
Iteration 0
Iteration 1
Iteration 2
Iteration 3
Iteration 4

=== reduce ===
Sum: 15
Product: 120

=== flat_map ===
1
2
3
4
5
6

=== take_while ===
2
4
6
```
