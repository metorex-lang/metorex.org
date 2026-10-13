---
title: "symbols_and_ranges/literal_range_ends.rb"
slug: symbols-and-ranges-literal-range-ends
description: "The metorex example program symbols_and_ranges/literal_range_ends.rb and its output."
---

`tests/_examples/symbols_and_ranges/literal_range_ends.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/symbols_and_ranges/literal_range_ends.rb){target=_blank rel=noopener}.

```metorex
# A range written with literal ends is built once, so the Strings at its ends
# are frozen. A range built from a variable keeps that String as it is.

letters = "a".."b"
p([letters.frozen?, letters.begin.frozen?, letters.end.frozen?])

start = +"c"
built = start.."d"
p([built.begin.frozen?, built.end.frozen?])
```

Output:

```
[true, true, true]
[false, false]
```
