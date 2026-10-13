---
title: "c_extensions/c_blocks_no_parens.rb"
slug: c-extensions-c-blocks-no-parens
description: "The metorex example program c_extensions/c_blocks_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_blocks_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_blocks_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A C extension yielding to the block it was called with, working with
# Sets, and making Integers from C integers of every width.
require "tmpdir"
require_relative "build_helper"

class Pair
  def initialize(held)
    @held = held
  end

  def to_ary
    @held
  end
end

directory = Dir.mktmpdir
require build_extension("c_blocks.c", "c_blocks", directory)
blocks = CBlocks.new

p blocks.given
p(blocks.given { 1 })
p(blocks.yield_one(5) { |value| value * 2 })
p(blocks.yield_none { |*values| values })
p(blocks.yield_two(1, 2) { |first, second| first + second })
p(blocks.yield_splat([3, 4]) { |first, second| [second, first] })
report { blocks.yield_splat(3) { 1 } }
p(blocks.yield_splat(Pair.new([5, 6])) { |first, second| first * second })
report { blocks.yield_splat(Pair.new(nil)) { 1 } }
report { blocks.yield_splat(Pair.new(7)) { 1 } }
report { blocks.yield_one 1 }
p(blocks.yield_then { |value| break value + 100 })
p(blocks.yield_then { |value| value })

seen = []
p blocks.walk(Set[1, 2, 3, 4, 5], seen)
p seen
p blocks.walk(Set[], seen)
p blocks.set_calls
p blocks.empty_set

p blocks.conversions

FileUtils.rm_rf directory
```

Output:

```
false
true
10
[]
3
[4, 3]
ArgumentError: not an array
30
ArgumentError: not an array
TypeError: can't convert Pair to Array (Pair#to_ary gives Integer)
LocalJumpError: no block given (yield)
101
:finished
Set[1, 3, 4, 5]
[1, 2, 3, 4]
Set[]
[true, false, true, false, 1, true, false, Set[]]
Set[]
[-5, 18446744073709551615, -9223372036854775808, 9223372036854775808, 7, -7]
```
