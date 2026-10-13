---
title: "methods/optional_before_required/binding_no_parens.rb"
slug: methods-optional-before-required-binding-no-parens
description: "The metorex example program methods/optional_before_required/binding_no_parens.rb and its output."
---

`tests/_examples/methods/optional_before_required/binding_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/optional_before_required/binding_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A required parameter after an optional one binds from the end of the
# argument list, so the optional ones take what is left in the middle.

def pad(prefix = "<", value)
  "#{prefix}#{value}"
end

puts pad "only"
puts pad "[", "both"

def surround(open = "(", middle = "-", close)
  "#{open}#{middle}#{close}"
end

puts surround(")")
puts surround("=", ")")
puts surround("{", "=", "}")

def tail(first, second = 2, third = 3, last)
  [first, second, third, last].inspect
end

puts tail(1, 9)
puts tail(1, 8, 9)
puts tail(1, 7, 8, 9)
```

Output:

```
<only
[both
(-)
=-)
{=}
[1, 2, 3, 9]
[1, 8, 3, 9]
[1, 7, 8, 9]
```
