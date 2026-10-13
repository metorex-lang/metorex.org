---
title: "linear_algebra/eigenvalues_no_parens.rb"
slug: linear-algebra-eigenvalues-no-parens
description: "The metorex example program linear_algebra/eigenvalues_no_parens.rb and its output."
---

`tests/_examples/linear_algebra/eigenvalues_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/linear_algebra/eigenvalues_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A matrix answers its eigenvalues as Floats, with a conjugate pair where
# the roots are not real.
require "matrix"

real = Matrix[[14, 16], [-6, -6]]
p real.eigensystem.eigenvalues
p real.eigensystem.eigenvalue_matrix

turning = Matrix[[1, 1], [-1, 1]]
p turning.eigensystem.eigenvalues
p turning.eigensystem.eigenvalue_matrix

p Matrix[[1, 2, 3], [4, 5, 6], [7, 8, 9]].eigensystem.eigenvalues.map { |value| value.round 6 }
```

Output:

```
[6.0, 2.0]
Matrix[[6.0, 0], [0, 2.0]]
[(1.0+1.0i), (1.0-1.0i)]
Matrix[[(1.0+1.0i), 0], [0, (1.0-1.0i)]]
[16.116844, -1.116844, 0.0]
```
