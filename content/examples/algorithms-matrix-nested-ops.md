---
title: "algorithms/matrix_nested_ops.rb"
slug: algorithms-matrix-nested-ops
description: "The metorex example program algorithms/matrix_nested_ops.rb and its output."
---

`tests/_examples/algorithms/matrix_nested_ops.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/matrix_nested_ops.rb).

```metorex
# Test nested array operations and matrix operations combined

# 1. Create a matrix using nested arrays
matrix = [[1, 2, 3], [4, 5, 6]]
puts "Original matrix:"
puts matrix

# 2. Access nested elements
puts "Element at [0][0]:"
puts matrix[0][0]
puts "Element at [1][2]:"
puts matrix[1][2]

# 3. Map over rows
doubled = matrix.map do |row|
  row.map do |x|
    x * 2
  end
end
puts "Doubled matrix:"
puts doubled

# 4. Transpose and then map
transposed = matrix.transpose
result = transposed.map do |col|
  col.reduce do |a, b|
    a + b
  end
end
puts "Sum of each column:"
puts result

# 5. Filter rows based on condition
matrix2 = [[1, 2], [3, 4], [5, 6]]
filtered = matrix2.filter do |row|
  row[0] > 2
end
puts "Rows where first element > 2:"
puts filtered
```

Output:

```
Original matrix:
1
2
3
4
5
6
Element at [0][0]:
1
Element at [1][2]:
6
Doubled matrix:
2
4
6
8
10
12
Sum of each column:
5
7
9
Rows where first element > 2:
3
4
5
6
```
