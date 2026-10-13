---
title: "stdlib/string/format_keywords_parens.rb"
slug: stdlib-string-format-keywords-parens
description: "The metorex example program stdlib/string/format_keywords_parens.rb and its output."
---

`tests/_examples/stdlib/string/format_keywords_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/format_keywords_parens.rb){target=_blank rel=noopener}.

```metorex
puts(format("%s and %s", "a", "b"))
puts(format("test %{name}", name: "value"))
puts(format("%{greeting}, %{who}!", greeting: "hello", who: "world"))
puts(format("%<count>05d", count: 42))
puts(format("%<ratio>.2f", ratio: 3.14159))
puts(Kernel.format("%s", "through the module"))

begin
  format("%{missing}", present: 1)
rescue KeyError => error
  puts(error.message)
end

puts(Kernel.private_instance_methods.include?(:format))
puts(Kernel.private_instance_methods.include?(:sprintf))
```

Output:

```
a and b
test value
hello, world!
00042
3.14
through the module
key{missing} not found
true
true
```
