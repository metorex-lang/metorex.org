---
title: "rex/primitives/diff_pairing.rb"
slug: rex-primitives-diff-pairing
description: "The metorex example program rex/primitives/diff_pairing.rb and its output."
---

`tests/_examples/rex/primitives/diff_pairing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/primitives/diff_pairing.rb).

```metorex
# Rex's differ pairs the lines of two texts through Rex::Diff.__matches__,
# which answers, for each line of the first, the line of the second it is
# paired with, or nil.
require "rspec/core"

def pairing(old, new) = Rex::Diff.__matches__(old.split, new.split)

p pairing("a b c", "a b c")
p pairing("a b x", "a b")
p pairing("a b c d e", "a x c y e")
p pairing("a b c", "b a c")
p pairing("a b", "c d")
```
