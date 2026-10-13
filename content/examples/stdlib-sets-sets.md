---
title: "stdlib/sets/sets.rb"
slug: stdlib-sets-sets
description: "The metorex example program stdlib/sets/sets.rb and its output."
---

`tests/_examples/stdlib/sets/sets.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/sets/sets.rb){target=_blank rel=noopener}.

```metorex
# Set methods demonstration

# Creating sets
s = Set.new
s.add(1)
s.add(2)
s.add(3)
s.add(2)
puts s.size

# From array
s2 = Set.new([10, 20, 30, 20])
puts s2.size

# Membership
puts s.contains?(2)
puts s.contains?(99)

# Remove
s.remove(2)
puts s.size

# empty?
puts Set.new.empty?
puts s.empty?

# Set operations
a = Set.new([1, 2, 3, 4])
b = Set.new([3, 4, 5, 6])

puts a.union(b).size
puts a.intersection(b).size
puts a.difference(b).size

# each
total = 0
Set.new([10, 20, 30]).each { |x| total += 1 }
puts total

# to_a
puts Set.new([1, 2, 3]).to_a.length
```

Output:

```
3
3
true
false
2
true
false
6
2
2
3
3
```
