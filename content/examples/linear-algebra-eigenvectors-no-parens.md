---
title: "linear_algebra/eigenvectors_no_parens.rb"
slug: linear-algebra-eigenvectors-no-parens
description: "The metorex example program linear_algebra/eigenvectors_no_parens.rb and its output."
---

`tests/_examples/linear_algebra/eigenvectors_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/linear_algebra/eigenvectors_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The eigenvectors of a two by two matrix, the matrix they form, and the
# factorization that matrix takes part in. A fractional power is taken there
# too, on the diagonal.
require "matrix"

symmetric = Matrix[[1, 2], [2, 1]]
p symmetric.eigensystem.eigenvalues
p symmetric.eigensystem.eigenvectors
p symmetric.eigensystem.eigenvector_matrix

turning = Matrix[[1, 1], [-1, 1]]
p turning.eigensystem.eigenvectors

real = Matrix[[14, 16], [-6, -6]]
basis, diagonal, back = real.eigensystem.to_a
p (basis * diagonal * back).map { |entry| entry.round 10 }

rooted = Matrix[[5, 4], [4, 5]]**0.5
p (rooted**2).round 8
```

Output:

```
[-0.9999999999999996, 3.0]
[Vector[0.7071067811865475, -0.7071067811865475], Vector[0.7071067811865475, 0.7071067811865475]]
Matrix[[0.7071067811865475, 0.7071067811865475], [-0.7071067811865475, 0.7071067811865475]]
[Vector[(1.0+0.0i), (0.0+1.0i)], Vector[(1.0-0.0i), (0.0-1.0i)]]
Matrix[[14.0, 16.0], [-6.0, -6.0]]
Matrix[[5.0, 4.0], [4.0, 5.0]]
```
