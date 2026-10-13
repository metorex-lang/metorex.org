---
title: "callables/proc_case_compare_no_parens.rb"
slug: callables-proc-case-compare-no-parens
description: "The metorex example program callables/proc_case_compare_no_parens.rb and its output."
---

`tests/_examples/callables/proc_case_compare_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/proc_case_compare_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Proc#=== calls the proc with the given argument, so a callable can stand in
# for a pattern in a case/when.
positive = proc { |number| number > 0 }
p positive === 5
p positive === -5

pair = proc { |first, second| [first, second] }
p pair === [1, 2]

strict = lambda { |first, second| [first, second] }
p strict.=== 1, 2

begin
  strict.=== 1
rescue ArgumentError => trouble
  p trouble.message
end

def describe value
  even = proc { |number| number.even? }
  small = lambda { |number| number < 10 }
  case value
  when even then "even"
  when small then "small and odd"
  else "large and odd"
  end
end

p describe 4
p describe 7
p describe 11
```

Output:

```
true
false
[1, 2]
[1, 2]
"wrong number of arguments (given 1, expected 2)"
"even"
"small and odd"
"large and odd"
```
