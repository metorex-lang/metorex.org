---
title: "basics/symbols/operator_names_parens.rb"
slug: basics-symbols-operator-names-parens
description: "The metorex example program basics/symbols/operator_names_parens.rb and its output."
---

`tests/_examples/basics/symbols/operator_names_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/symbols/operator_names_parens.rb).

```metorex
# A symbol can name any operator method, which is how `send` reaches one.
p(6.send(:/, 2))
p(2.send(:**, 3))
p(6.send(:&, 3))
p(6.send(:|, 1))
p(2.send(:-@))
p(2.send(:+@))
p(-2.send(:-@))
p(2.5.send(:-@))
p(:/)
p(:**)
p(:-@)
p(:!)

# A colon with anything between it and the slash still opens a regular
# expression, in a ternary and in a hash alike.
p(true ? 1 : /re/.source)
p({ key: /ab/ }.keys)
```

Output:

```
3
8
2
7
-2
2
2
-2.5
:/
:**
:-@
:!
1
[:key]
```
