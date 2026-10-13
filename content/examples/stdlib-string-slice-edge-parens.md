---
title: "stdlib/string/slice_edge_parens.rb"
slug: stdlib-string-slice-edge-parens
description: "The metorex example program stdlib/string/slice_edge_parens.rb and its output."
---

`tests/_examples/stdlib/string/slice_edge_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/slice_edge_parens.rb){target=_blank rel=noopener}.

```metorex
# Slice with 2 args
s = "hello"
puts s[1, 3]
puts s[0, 2]
puts s[-3, 2]

# A start past the end names no substring, where a start at the end
# names the empty one
p s[100, 2]
p s[5, 2]
puts "done"

# String + method
a = "foo"
b = a + "bar"
puts b
```

Output:

```
ell
he
ll
nil
""
done
foobar
```
