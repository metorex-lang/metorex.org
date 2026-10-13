---
title: "symbols_and_ranges/binary_search.rb"
slug: symbols-and-ranges-binary-search
description: "The metorex example program symbols_and_ranges/binary_search.rb and its output."
---

`tests/_examples/symbols_and_ranges/binary_search.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/symbols_and_ranges/binary_search.rb).

```metorex
# `bsearch` halves a numeric range: a block answering true or false finds the
# smallest element it says yes to, and one answering a number finds the
# element it answers zero for.
p (0..10).bsearch { |number| number >= 4 }
p (0...4).bsearch { |number| number >= 4 }
p (0..10).bsearch { |number| number < 3 ? 1 : number > 3 ? -1 : 0 }
p (0..10).bsearch { nil }
p (1.0..3.0).bsearch { |number| number >= 3.0 }
p (0..).bsearch { |number| number >= 7 }
p (..10).bsearch { |number| number >= 2 }
p (0..1).bsearch.class

begin
  ("a".."e").bsearch { true }
rescue TypeError => problem
  puts problem.message
end

begin
  (0..1).bsearch { Object.new }
rescue TypeError => problem
  puts problem.message
end
```

Output:

```
4
nil
3
nil
3.0
7
2
Enumerator
can't do binary search for String
wrong argument type Object (must be numeric, true, false or nil)
```
