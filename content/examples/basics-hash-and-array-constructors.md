---
title: "basics/hash_and_array_constructors.rb"
slug: basics-hash-and-array-constructors
description: "The metorex example program basics/hash_and_array_constructors.rb and its output."
---

`tests/_examples/basics/hash_and_array_constructors.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/hash_and_array_constructors.rb).

```metorex
# `Hash[]` reads a list of pairs, a hash, or one argument that answers
# `to_hash` or `to_ary`, and refuses an element that names no pair.
p(Hash[[[:a, :b], [:c, :d]]])
p(Hash[[[:a]]])
begin
  Hash[[:a]]
rescue ArgumentError => refused
  p(refused.message)
end
begin
  Hash[[[:a, :b, :c]]]
rescue ArgumentError => refused
  p(refused.message)
end

class Pairs
  def to_ary
    [[:a, :b]]
  end
end
p(Hash[Pairs.new])

# `Array.new` given an array takes its elements rather than a size, and
# refuses a default alongside one.
p(Array.new([4, 5, 6]))

class Listed
  def to_ary
    [1, 2]
  end
end
p(Array.new(Listed.new))
begin
  Array.new([1, 2], 1)
rescue TypeError => refused
  p(refused.class)
end
```

Output:

```
{a: :b, c: :d}
{a: nil}
"wrong element type Symbol at 0 (expected array)"
"invalid number of elements (3 for 1..2)"
{a: :b}
[4, 5, 6]
[1, 2]
TypeError
```
