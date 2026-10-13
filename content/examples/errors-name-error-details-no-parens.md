---
title: "errors/name_error_details_no_parens.rb"
slug: errors-name-error-details-no-parens
description: "The metorex example program errors/name_error_details_no_parens.rb and its output."
---

`tests/_examples/errors/name_error_details_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/name_error_details_no_parens.rb).

```metorex
# A NameError carries the object a name was looked up on and the local
# variables in scope where it was raised, and a NoMethodError whether the
# call named no receiver or named `self`.
module Annotated
  def detailed_message(highlight: false, **)
    "[annotated] " + super
  end
end
NameError.prepend Annotated

class NameError
  def shelf_label = "label for #{name}"
end

class Pantry
  def stock = misspelled_stock
  def count = self.counted
  def ask(other) = other.counted
end

total = 3
error = (misspelled_total rescue $!)
p [error.receiver, error.local_variables, error.respond_to?(:local_variables)]
p error.shelf_label
p error.detailed_message(highlight: false, error_highlight: false, did_you_mean: false)

def in_block
  outer = 1
  [outer].map { inside_block = 2; misspelled }
end
error = (in_block rescue $!)
p error.local_variables

pantry = Pantry.new
error = (pantry.stock rescue $!)
p [error.receiver.class, error.local_variables]

error = (missing_call(1) rescue $!)
p [error.class, error.message, error.private_call?, error.respond_to?(:private_call?)]
error = (self.missing_call rescue $!)
p [error.message, error.private_call?]
error = (pantry.count rescue $!)
p [error.message, error.private_call?]
error = (pantry.ask(pantry) rescue $!)
p [error.message, error.private_call?]
error = ("text".missing_call rescue $!)
p [error.message, error.private_call?, error.local_variables.include?(:total)]

p NoMethodError.new("built", :built, [], true).private_call?
p NoMethodError.new("built").private_call?
p NameError.new("built").local_variables.include?(:total)
p KeyError.new("built").respond_to?(:key)
p KeyError.new("built").respond_to?(:private_call?)
```

Output:

```
[main, [:total, :error, :pantry], true]
"label for misspelled_total"
"[annotated] undefined local variable or method 'misspelled_total' for main (NameError)"
[:inside_block, :outer]
[Pantry, []]
[NoMethodError, "undefined method 'missing_call' for main", true, true]
["undefined method 'missing_call' for main", true]
["undefined method 'counted' for an instance of Pantry", true]
["undefined method 'counted' for an instance of Pantry", false]
["undefined method 'missing_call' for an instance of String", false, true]
true
false
true
true
false
```
