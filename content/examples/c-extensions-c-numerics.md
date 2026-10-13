---
title: "c_extensions/c_numerics.rb"
slug: c-extensions-c-numerics
description: "The metorex example program c_extensions/c_numerics.rb and its output."
---

`tests/_examples/c_extensions/c_numerics.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_numerics.rb).

```metorex
# A C extension making and reading Floats, Complex numbers and Rationals.
require "tmpdir"
require_relative "build_helper"

directory = Dir.mktmpdir
require(build_extension("c_numerics.c", "c_numerics", directory))
numerics = CNumerics.new

p(numerics.half)
p(numerics.doubled(1.25))
report { numerics.doubled(2) }
p([numerics.is_float(1.0), numerics.is_float(1), numerics.is_float(nil)])
p(numerics.to_float("2.5"))
p(numerics.to_float(3))
report { numerics.to_float("many") }

p(numerics.complex(1, 2))
p(numerics.complex("3", "4"))
p(numerics.complex_real(5))
p(numerics.complex_new(10, 4))
p(numerics.complex_new_real(6))
p(numerics.complex_new(1.5, 2))

p(numerics.rational(1, 2))
p(numerics.rational("3", "4"))
p(numerics.rational_whole(5))
p(numerics.rational_new(10, 4))
p(numerics.rational_new_whole(6))
report { numerics.rational_new(1, 0) }
p(numerics.parts(Rational(7, 2)))

FileUtils.rm_rf(directory)
```

Output:

```
0.5
2.5
TypeError: wrong argument type Integer (expected Float)
[true, false, false]
2.5
3.0
ArgumentError: invalid value for Float(): "many"
(1+2i)
(3+4i)
(5+0i)
(10+4i)
(6+0i)
(1.5+2i)
(1/2)
(3/4)
(5/1)
(5/2)
(6/1)
ZeroDivisionError: divided by 0
[7, 2]
```
