---
title: "stdlib/matrix_eigen_no_parens.rb"
slug: stdlib-matrix-eigen-no-parens
description: "The metorex example program stdlib/matrix_eigen_no_parens.rb and its output."
---

`tests/_examples/stdlib/matrix_eigen_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/matrix_eigen_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The eigenvalues and eigenvectors of square matrices of any size: a
# symmetric matrix has real ones, and another may have complex pairs.
require "matrix"

symmetric = Matrix[[4, 1, 2], [1, 3, 0], [2, 0, 5]]
decomposed = symmetric.eigen
p decomposed.eigenvalues.map { |value| value.round 10 }
p decomposed.eigenvectors.size
vectors, values, inverse = decomposed
rebuilt = vectors * values * inverse - symmetric
p rebuilt.to_a.flatten.all? { |entry| entry.abs < 1e-9 }

rotation = Matrix[[0, -1], [1, 0]]
p rotation.eigen.eigenvalues
p rotation.eigen.eigenvectors.map(&:to_a)

general = Matrix[[0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 1, 0], [1, 1, 0, 0, 1], [1, 0, 1, 0, 1]]
p general.eigen.eigenvalues.size

begin
  Matrix[[1, 2]].eigen
rescue Matrix::ErrDimensionMismatch => error
  p error.class
end
begin
  Matrix::EigenvalueDecomposition.new 42
rescue TypeError => error
  p error.message
end
```

Output:

```
[1.8548973088, 3.4760236029, 6.6690790883]
3
true
[(0.0+1.0i), (0.0-1.0i)]
[[(-1.0+0.0i), (0.0+1.0i)], [(-1.0-0.0i), (0.0-1.0i)]]
5
ExceptionForMatrix::ErrDimensionMismatch
"Expected Matrix but got Integer"
```
