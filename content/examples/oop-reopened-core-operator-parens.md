---
title: "oop/reopened_core_operator_parens.rb"
slug: oop-reopened-core-operator-parens
description: "The metorex example program oop/reopened_core_operator_parens.rb and its output."
---

`tests/_examples/oop/reopened_core_operator_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/reopened_core_operator_parens.rb){target=_blank rel=noopener}.

```metorex
module Counting; end

class Integer
  prepend Counting
end

$additions = []

sum = -> { 1 + 2 }
p sum.call

Counting.module_eval do
  def +(other)
    $additions.push(other)
    super(other)
  end
end

p sum.call
p $additions

class String
  def -(other)
    sub(other, "")
  end
end

p "hello world" - " world"
```

Output:

```
3
3
[2]
"hello"
```
