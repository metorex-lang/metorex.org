---
title: "syntax/literal_conditions_fixture.rb"
slug: syntax-literal-conditions-fixture
description: "The metorex example program syntax/literal_conditions_fixture.rb and its output."
---

`tests/_examples/syntax/literal_conditions_fixture.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/literal_conditions_fixture.rb){target=_blank rel=noopener}.

```metorex
if 1..2 then end
if /a/ then end
if "s" then end
x = 3 if /a/
p(x)
if w = 2 then end
p(1) if v = [1, :a]
while (u = nil) do end
if t = x then end
```
