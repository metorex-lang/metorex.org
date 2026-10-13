---
title: "symbols_and_ranges/range_cover_and_include_no_parens.rb"
slug: symbols-and-ranges-range-cover-and-include-no-parens
description: "The metorex example program symbols_and_ranges/range_cover_and_include_no_parens.rb and its output."
---

`tests/_examples/symbols_and_ranges/range_cover_and_include_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/symbols_and_ranges/range_cover_and_include_no_parens.rb){target=_blank rel=noopener}.

```metorex
# `cover?` with a Range asks whether every value of it falls inside.
p((0..10).cover? 4...11)
p((0...10).cover? 4..10)
p((0..).cover? 4..)
p((nil...nil).cover? 4..)
p((0..10).cover? 5..3)
p((0..).cover? 4..6)
# A range ending on a Float it leaves out names no largest value.
p((0..10).cover? 4.0...11.0)
# `===` with a Range compares the Range itself, which no Integer range holds.
p((1..10) === (2..3))

# `include?` compares against the ends for numbers, walks a String range as
# `upto` does, and cannot decide for a range missing an end.
p(("a".."ab").include? "b")
p(("a".."ab").include? "ac")
p((nil..nil).include? 5)
p(("a".."ab").include? nil)
p(("a".."ab").include? Object.new)
spelled = Object.new
def spelled.to_str
  "b"
end
p(("a".."ab").include? spelled)
wrong = Object.new
def wrong.to_str
  1
end
begin
  ("a".."ab").include? wrong
rescue TypeError => problem
  p problem.message
end
p((Rational(1, 2)..Rational(5, 2)).include? 2)
p((:aa..:ac).to_a)
# A range of objects with `succ` walks its values to find one.
class Rung
  include Comparable
  attr_reader :height

  def initialize height
    @height = height
  end

  def succ
    Rung.new height + 2
  end

  def <=> other
    height <=> other.height
  end
end
p((Rung.new(0)..Rung.new(6)).include? Rung.new(4))
p((Rung.new(0)..Rung.new(6)).include? Rung.new(3))
[("aa"..), (.."aa")].each do |range|
  begin
    range.include? "a"
  rescue TypeError => problem
    p problem.message
  end
end

# `step` refuses to walk from a missing beginning.
begin
  (..10).step(1) { break }
rescue ArgumentError => problem
  p problem.message
end
begin
  (..10).step "a"
rescue ArgumentError => problem
  p problem.message
end
```

Output:

```
true
false
true
false
false
true
false
false
true
false
true
false
false
true
"can't convert Object to String (Object#to_str gives Integer)"
true
[:aa, :ab, :ac]
true
false
"cannot determine inclusion in beginless/endless ranges"
"cannot determine inclusion in beginless/endless ranges"
"#step iteration for beginless ranges is meaningless"
"#step for non-numeric beginless ranges is meaningless"
```
