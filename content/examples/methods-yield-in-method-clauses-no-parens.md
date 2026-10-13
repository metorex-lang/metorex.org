---
title: "methods/yield_in_method_clauses_no_parens.rb"
slug: methods-yield-in-method-clauses-no-parens
description: "The metorex example program methods/yield_in_method_clauses_no_parens.rb and its output."
---

`tests/_examples/methods/yield_in_method_clauses_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/yield_in_method_clauses_no_parens.rb).

```metorex
# A method's own rescue, else and ensure clauses belong to its body, so
# `yield` there hands values to the block the method was called with.
def recovering
  raise ArgumentError, "first try"
rescue ArgumentError => error
  yield error.message
end

def finishing
  :body
ensure
  yield :ensure
end

def succeeding
  :body
rescue
  :never
else
  yield :else
end

p recovering { |message| "recovered from #{message}" }
p finishing { |where| puts "ran in #{where}" }
p succeeding { |where| "answered from #{where}" }
```

Output:

```
"recovered from first try"
ran in ensure
:body
"answered from else"
```
