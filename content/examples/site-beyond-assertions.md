---
title: "site/beyond_assertions.rb"
slug: site-beyond-assertions
description: "The metorex example program site/beyond_assertions.rb and its output."
---

`tests/_examples/site/beyond_assertions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/beyond_assertions.rb){target=_blank rel=noopener}.

```metorex
assert(3.between?(1, 5))
assert_equal(4, 2 + 2)
assert_raises { Integer("four") }

begin
  assert_equal(5, [2, 2].sum)
rescue RuntimeError => failure
  puts failure.message
end
```

Output:

```
Expected 5, got 4
```
