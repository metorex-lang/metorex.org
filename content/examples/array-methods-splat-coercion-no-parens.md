---
title: "array_methods/splat_coercion_no_parens.rb"
slug: array-methods-splat-coercion-no-parens
description: "The metorex example program array_methods/splat_coercion_no_parens.rb and its output."
---

`tests/_examples/array_methods/splat_coercion_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/splat_coercion_no_parens.rb).

```metorex
spreadable = Object.new
def spreadable.to_a
  [2, 3, 4]
end
puts [1, *spreadable].inspect

plain = Object.new
puts [1, *plain].class.to_s

def collect(*given)
  given
end
puts collect(1, *spreadable).inspect

letters = ("a".."e").to_a
bounds = [1, 3]
letters[*bounds] = "x"
puts letters.inspect

def hands_over(values)
  yield(*values)
end
puts hands_over(nil) { |*taken| taken }.inspect
puts hands_over([1, 2]) { |*taken| taken }.inspect

words = %W(a\  b\tc)
puts words.inspect
plain_words = %w(a b\ c)
puts plain_words.inspect
```

Output:

```
[1, 2, 3, 4]
Array
[1, 2, 3, 4]
["a", "x", "e"]
[]
[1, 2]
["a ", "b\tc"]
["a", "b c"]
```
