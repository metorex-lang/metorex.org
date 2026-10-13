---
title: "linear_algebra/matrix_aliases.rb"
slug: linear-algebra-matrix-aliases
description: "The metorex example program linear_algebra/matrix_aliases.rb and its output."
---

`tests/_examples/linear_algebra/matrix_aliases.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/linear_algebra/matrix_aliases.rb).

```metorex
require "matrix"
require "time"
require "ostruct"

# The matrix, time and ostruct libraries name some methods twice with
# `alias`, which a Method for either name reports.
p Matrix.instance_method(:map).original_name
p Matrix.instance_method(:collect) == Matrix.instance_method(:map)
p Matrix.method(:I) == Matrix.method(:identity)
p Vector.instance_method(:norm) == Vector.instance_method(:magnitude)
p Matrix[[1, 2], [3, 4]].t
p Matrix[[1, 2], [3, 4]].det
p Time.method(:rfc822) == Time.method(:rfc2822)
p Time.method(:iso8601) == Time.method(:xmlschema)
p Time.at(0).utc.rfc822
p OpenStruct.instance_method(:to_s) == OpenStruct.instance_method(:inspect)
```

Output:

```
:collect
true
true
true
Matrix[[1, 3], [2, 4]]
-2
true
true
"Thu, 01 Jan 1970 00:00:00 -0000"
true
```
