---
title: "stdlib/string/dump_parens.rb"
slug: stdlib-string-dump-parens
description: "The metorex example program stdlib/string/dump_parens.rb and its output."
---

`tests/_examples/stdlib/string/dump_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/dump_parens.rb){target=_blank rel=noopener}.

```metorex
puts("plain".dump)
puts("with \"quotes\"".dump)
puts("tab\there".dump)
puts("line\nbreak".dump)
puts("back\\slash".dump)
puts('interp #{x} and #@ivar'.dump)
puts("café".dump)
```

Output:

```
"plain"
"with \"quotes\""
"tab\there"
"line\nbreak"
"back\\slash"
"interp \#{x} and \#@ivar"
"caf\u00E9"
```
