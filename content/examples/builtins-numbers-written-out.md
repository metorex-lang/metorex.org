---
title: "builtins/numbers_written_out.rb"
slug: builtins-numbers-written-out
description: "The metorex example program builtins/numbers_written_out.rb and its output."
---

`tests/_examples/builtins/numbers_written_out.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/numbers_written_out.rb).

```metorex
# A Float writes itself with a decimal point, and one whose point sits far
# from its digits is written in exponent form.
puts 1.5.to_s
puts 1000000000000000.0.to_s
puts 0.0001.to_s
puts 0.00001.to_s
puts 2.554021731435405e+163.to_s
puts 1.0e+16.inspect
puts 1e15.to_s.encoding.to_s

# `pow` raises a number, and a modulus keeps the answer small.
puts 2.pow(10).to_s
puts 2.pow(61, 5843009213693951).to_s
puts 2.pow(5, -12).to_s
```

Output:

```
1.5
1.0e+15
0.0001
1.0e-05
2.554021731435405e+163
1.0e+16
US-ASCII
1024
3697379018277258
-4
```
