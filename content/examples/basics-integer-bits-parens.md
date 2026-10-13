---
title: "basics/integer_bits_parens.rb"
slug: basics-integer-bits-parens
description: "The metorex example program basics/integer_bits_parens.rb and its output."
---

`tests/_examples/basics/integer_bits_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/integer_bits_parens.rb){target=_blank rel=noopener}.

```metorex
# A subscript on an Integer reads the bits of its two's-complement form: one
# by position, a run from a position and a length, or the run a range spans.
negative = -1
p(0b101[0])
p(0b101[1])
p(negative[3])
p(3[-1])
p(13[2.1])
p(0b101001101[2, 4])
p(0b101001101[1, -1])
p(0b000001[-3, 4])
p(0b101001101[2..5])
p(0b101001101[3..])
p(0b10000[..1])

begin
  p(0b111110[..3])
rescue ArgumentError => problem
  puts(problem.message)
end

begin
  p(1[3..Float::INFINITY])
rescue FloatDomainError => problem
  puts(problem.message)
end
```

Output:

```
1
0
1
0
1
3
166
8
3
41
0
The beginless range for Integer#[] results in infinity
Infinity
```
