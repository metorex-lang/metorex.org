---
title: "symbols_and_ranges/literal_range_ends_no_parens.rb"
slug: symbols-and-ranges-literal-range-ends-no-parens
description: "The metorex example program symbols_and_ranges/literal_range_ends_no_parens.rb and its output."
---

`tests/_examples/symbols_and_ranges/literal_range_ends_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/symbols_and_ranges/literal_range_ends_no_parens.rb).

```metorex
# A range written with literal ends is built once, so the Strings at its ends
# are frozen. A range built from a variable keeps that String as it is.

letters = "a".."b"
p [letters.frozen?, letters.begin.frozen?, letters.end.frozen?]

start = +"c"
built = start.."d"
p [built.begin.frozen?, built.end.frozen?]
```

Output:

```
[true, true, true]
[false, false]
```
