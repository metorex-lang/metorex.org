---
title: "globals/toplevel_binding/live_locals_parens.rb"
slug: globals-toplevel-binding-live-locals-parens
description: "The metorex example program globals/toplevel_binding/live_locals_parens.rb and its output."
---

`tests/_examples/globals/toplevel_binding/live_locals_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/toplevel_binding/live_locals_parens.rb){target=_blank rel=noopener}.

```metorex
# TOPLEVEL_BINDING stands over the script's own top level: a name assigned
# there is reserved from the start and reads back as it is set.
p TOPLEVEL_BINDING.local_variable_get(:counter)
counter = 1
p TOPLEVEL_BINDING.local_variable_get(:counter)
counter = 2
p TOPLEVEL_BINDING.local_variable_get(:counter)
p TOPLEVEL_BINDING.local_variables.sort

# A name set through the binding joins the ones the script wrote.
TOPLEVEL_BINDING.local_variable_set(:through_the_binding, 3)
p TOPLEVEL_BINDING.local_variables.sort
```

Output:

```
nil
1
2
[:counter]
[:counter, :through_the_binding]
```
