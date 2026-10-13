---
title: "linear_algebra/matrices_and_vectors_no_parens.rb"
slug: linear-algebra-matrices-and-vectors-no-parens
description: "The metorex example program linear_algebra/matrices_and_vectors_no_parens.rb and its output."
---

`tests/_examples/linear_algebra/matrices_and_vectors_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/linear_algebra/matrices_and_vectors_no_parens.rb).

```metorex
# Rectangular arrays of numbers and the arithmetic over them.
require 'matrix'

grid = Matrix[[1, 2], [3, 4]]

p grid.row_size
p grid.column_size
p grid.row 0
p grid.column 1
p grid.row(-1)
p grid.row(5)
p grid[0, 1]
p grid.to_a
p grid.row_vectors
p grid.column_vectors

p grid + Matrix[[1, 1], [1, 1]]
p grid - Matrix[[1, 1], [1, 1]]
p grid * Matrix[[0, 1], [1, 0]]
p grid * 2
p grid ** 2
p (-grid)
p grid.transpose
p grid.t

p grid.determinant
p grid.trace
p grid.rank
p grid.inverse
p grid * grid.inverse == Matrix.identity(2)

p Matrix.identity(2)
p Matrix.zero(2)
p Matrix.diagonal(1, 2)
p Matrix.scalar(2, 5)
p Matrix.row_vector [1, 2]
p Matrix.column_vector [1, 2]
p Matrix.build(2, 2) { |row, column| row * 2 + column }
p Matrix.empty(0, 2).to_s

p grid.square?
p grid.symmetric?
p Matrix[[1, 2], [2, 1]].symmetric?
p Matrix[[1, 0], [0, 1]].diagonal?
p Matrix[[1, 0], [0, 1]].permutation?
p Matrix[[1, 2], [0, 1]].upper_triangular?
p Matrix.zero(2).zero?
p Matrix.empty(0, 2).empty?
p grid.regular?
p grid.collect { |value| value * 10 }
p grid.find_index 3
p grid.minor 0, 1, 0, 1
p grid.first_minor 0, 0

begin
  grid + Matrix[[1]]
rescue Matrix::ErrDimensionMismatch => error
  p error.class
end

begin
  grid + 2
rescue ExceptionForMatrix::ErrOperationNotDefined => error
  p error.class
end

left = Vector[1, 2, 3]
right = Vector[4, 5, 6]

p left + right
p left - right
p left * 2
p left.inner_product right
p left.cross_product right
p left.size
p left[1]
p left.to_a
p left.collect { |value| value + 1 }
p Vector[3, 4].magnitude
p Vector[3, 4].normalize
p Vector.zero(2)
p Vector.basis size: 3, index: 1
p Vector[0, 0].zero?
p left.covector
```

Output:

```
2
2
Vector[1, 2]
Vector[2, 4]
Vector[3, 4]
nil
2
[[1, 2], [3, 4]]
[Vector[1, 2], Vector[3, 4]]
[Vector[1, 3], Vector[2, 4]]
Matrix[[2, 3], [4, 5]]
Matrix[[0, 1], [2, 3]]
Matrix[[2, 1], [4, 3]]
Matrix[[2, 4], [6, 8]]
Matrix[[7, 10], [15, 22]]
Matrix[[-1, -2], [-3, -4]]
Matrix[[1, 3], [2, 4]]
Matrix[[1, 3], [2, 4]]
-2
5
2
Matrix[[(-2/1), (1/1)], [(3/2), (-1/2)]]
true
Matrix[[1, 0], [0, 1]]
Matrix[[0, 0], [0, 0]]
Matrix[[1, 0], [0, 2]]
Matrix[[5, 0], [0, 5]]
Matrix[[1, 2]]
Matrix[[1], [2]]
Matrix[[0, 1], [2, 3]]
"Matrix.empty(0, 2)"
true
false
true
true
true
true
true
true
true
Matrix[[10, 20], [30, 40]]
[1, 0]
Matrix[[1]]
Matrix[[4]]
ExceptionForMatrix::ErrDimensionMismatch
ExceptionForMatrix::ErrOperationNotDefined
Vector[5, 7, 9]
Vector[-3, -3, -3]
Vector[2, 4, 6]
32
Vector[-3, 6, -3]
3
2
[1, 2, 3]
Vector[2, 3, 4]
5.0
Vector[0.6, 0.8]
Vector[0, 0]
Vector[0, 1, 0]
true
Matrix[[1, 2, 3]]
```
