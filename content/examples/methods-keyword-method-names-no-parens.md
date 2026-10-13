---
title: "methods/keyword_method_names_no_parens.rb"
slug: methods-keyword-method-names-no-parens
description: "The metorex example program methods/keyword_method_names_no_parens.rb and its output."
---

`tests/_examples/methods/keyword_method_names_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/keyword_method_names_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Clause
  def in = "in"
  def then = "then"
  def do = "do"
  def redo = "redo"
  def retry = "retry"
  def and = "and"
  def or = "or"
  def not = "not"
  def unless = "unless"
end

clause = Clause.new
p [clause.in, clause.then, clause.do, clause.redo, clause.retry]
p [clause.and, clause.or, clause.not, clause.unless]

class Amount
  def initialize cents
    @cents = cents
  end

  def matches? other
    false
  end
  def present? = true
end

class Invoice < Amount
  def matches? other
    super or other == 100
  end
  def present?; super and @cents.positive?; end
end

p Invoice.new(100).matches? 100
p Invoice.new(100).matches? 5
p Invoice.new(0).present?
```

Output:

```
["in", "then", "do", "redo", "retry"]
["and", "or", "not", "unless"]
true
false
false
```
