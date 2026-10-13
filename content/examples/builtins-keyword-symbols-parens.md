---
title: "builtins/keyword_symbols_parens.rb"
slug: builtins-keyword-symbols-parens
description: "The metorex example program builtins/keyword_symbols_parens.rb and its output."
---

`tests/_examples/builtins/keyword_symbols_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/keyword_symbols_parens.rb){target=_blank rel=noopener}.

```metorex
x = :def
puts x
x = :class
puts x
x = :@ivar
puts x
x = :@@cvar
puts x
x = :yield
puts x
```

Output:

```
def
class
@ivar
@@cvar
yield
```
