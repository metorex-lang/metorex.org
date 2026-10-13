---
title: "procs/lambda_literal_chaining_parens.rb"
slug: procs-lambda-literal-chaining-parens
description: "The metorex example program procs/lambda_literal_chaining_parens.rb and its output."
---

`tests/_examples/procs/lambda_literal_chaining_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/procs/lambda_literal_chaining_parens.rb).

```metorex
puts(-> (value) { value * 2 }.call(3))
puts(->(value) { value * 2 }.call(4))
puts(-> value { value * 2 }.call(5))
puts(-> *values { values.last }.call(6, 7))
puts(-> value do value * 2 end.call(8))
puts(-> { 9 }.call)

def forwards(*args)
  -> *inner { inner.last }.call(*args)
end

puts(forwards(10, 11))
puts(-> (value) { value }.lambda?)
puts(-> (first, second) { first }.arity)
```

Output:

```
6
8
10
7
16
9
11
true
2
```
