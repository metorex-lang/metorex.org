---
title: "basics/imaginary_literals.rb"
slug: basics-imaginary-literals
description: "The metorex example program basics/imaginary_literals.rb and its output."
---

`tests/_examples/basics/imaginary_literals.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/imaginary_literals.rb).

```metorex
puts 1.3i.class
puts 2i.class
puts 1.3i.frozen?
puts Complex(0, 1.3).class

value = 5
puts 2if value > 1

whole = 4i
puts whole.class

puts 1r.class
```

Output:

```
Complex
Complex
true
Complex
2
Complex
Rational
```
