---
title: "procs/lambda_chained_comparison.rb"
slug: procs-lambda-chained-comparison
description: "The metorex example program procs/lambda_chained_comparison.rb and its output."
---

`tests/_examples/procs/lambda_chained_comparison.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/procs/lambda_chained_comparison.rb){target=_blank rel=noopener}.

```metorex
result = -> { 5 }.call == 5
p result
p(-> (value) { value * 2 }.call(3) == 6)
p -> { :sym }.call == :sym
p((-> { 1 }.call + 1) == 2)
```

Output:

```
true
true
true
true
```
