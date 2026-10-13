---
title: "oop/comparable/operators_need_comparable_no_parens.rb"
slug: oop-comparable-operators-need-comparable-no-parens
description: "The metorex example program oop/comparable/operators_need_comparable_no_parens.rb and its output."
---

`tests/_examples/oop/comparable/operators_need_comparable_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/comparable/operators_need_comparable_no_parens.rb).

```metorex
# The ordering operators come from Comparable, built on `<=>`. An object
# whose class does not include Comparable has no `<`, whatever `<=>` it
# answers, and a Comparable whose `<=>` answers nil names both sides in the
# ArgumentError.
class Plain
  def <=>(_other)
    0
  end
end

class Ranked
  include Comparable

  def initialize(rank)
    @rank = rank
  end

  attr_reader :rank

  def <=>(other)
    other.is_a?(Ranked) ? rank <=> other.rank : nil
  end
end

begin
  Plain.new < Plain.new
rescue NoMethodError => error
  puts error.message
end

p Ranked.new(1) < Ranked.new(2)

[nil, 2.5, :sym, "text", [1]].each do |other|
  begin
    Ranked.new(1) < other
  rescue ArgumentError => error
    puts error.message
  end
end

extended = Plain.new
extended.extend Comparable
p extended <= Plain.new
```

Output:

```
undefined method '<' for an instance of Plain
true
comparison of Ranked with nil failed
comparison of Ranked with 2.5 failed
comparison of Ranked with :sym failed
comparison of Ranked with String failed
comparison of Ranked with Array failed
true
```
