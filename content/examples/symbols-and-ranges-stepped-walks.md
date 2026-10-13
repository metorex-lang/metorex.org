---
title: "symbols_and_ranges/stepped_walks.rb"
slug: symbols-and-ranges-stepped-walks
description: "The metorex example program symbols_and_ranges/stepped_walks.rb and its output."
---

`tests/_examples/symbols_and_ranges/stepped_walks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/symbols_and_ranges/stepped_walks.rb).

```metorex
# A range over numbers counts its way along, and answers an arithmetic
# sequence when it is handed no block.
counted = (1..10).step 3
p counted.to_a
p counted.class
near_the_limit = (1.0...55.6).step 18.2
p near_the_limit.to_a
p near_the_limit.size

# A range over anything with a `succ` walks with it, handing out every step'th
# value it reaches.
every_other_letter = ("A".."G").step 2
p every_other_letter.to_a
p ("A".."E").step.to_a
every_other_name = (:a..:e).step 2
p every_other_name.to_a

# A step of no width hands out the first value and no more, since the count it
# waits on never comes round again.
standing_still = ("A".."E").step 0
p standing_still.to_a

# A step of another kind is added instead, and a range over anything but
# numbers answers a plain Enumerator whose size is unknown.
added = ("A".."AAA").step "A"
p added.to_a
lettered = ("A".."E").step "A"
p lettered.class
p lettered.size

# A step running against the range's direction reaches nothing.
against_the_range = ("E".."A").step "A"
p against_the_range.to_a

# A step that is no kind the beginning can be added to is refused.
begin
  ("A".."G").step [] do end
rescue TypeError => error
  puts error.message
end

# A range with nothing at either end names no walk at all.
begin
  Range.new(nil, nil).step 1
rescue ArgumentError => error
  puts error.message
end

begin
  Range.new(nil, nil).step
rescue ArgumentError => error
  puts error.message
end

# A step of some other kind over numbers is read through `coerce`, and only
# where the walk is about to run.
counter = Object.new
def counter.coerce(other)
  [other, 2]
end
coerced = (1..5).step counter
p coerced.to_a

plain = Object.new
unread = (1..2).step plain
p unread.class
begin
  (1..2).step plain do end
rescue TypeError => error
  puts error.message
end
```

Output:

```
[1, 4, 7, 10]
Enumerator::ArithmeticSequence
[1.0, 19.2, 37.4, 55.599999999999994]
4
["A", "C", "E", "G"]
["A", "B", "C", "D", "E"]
[:a, :c, :e]
["A"]
["A", "AA", "AAA"]
Enumerator
nil
[]
no implicit conversion of Array into String
#step for non-numeric beginless ranges is meaningless
step is required for non-numeric ranges
[1, 3, 5]
Enumerator
Object can't be coerced into Integer
```
