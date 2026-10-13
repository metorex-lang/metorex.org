---
title: "errors/error_highlight_spots.rb"
slug: errors-error-highlight-spots
description: "The metorex example program errors/error_highlight_spots.rb and its output."
---

`tests/_examples/errors/error_highlight_spots.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/error_highlight_spots.rb).

```metorex
def report
  yield
rescue Exception => error
  puts(error.detailed_message(highlight: false).gsub(__FILE__, "FILE"))
  puts("--")
end

def shipping_cost(weight, zone) = weight * zone

class Parcel
  attr_reader :weight
end

total = 10
report { total = totl + 1 }
report { order = nil; order.length }
report { sum = 1 + "2" }
report { shipping_cost(4) }
report { rows = nil; rows[0] }
report { nil.label = "fragile" }
report { [1].map(&:nope) }
report { Parcel.new.weight.round(nil) }
report { :upcase.to_proc.call }
report { Comparable.instance_method(:clamp).bind_call(1, "x", 2) }

begin
  Parcel.new.volume
rescue NoMethodError => error
  spot = ErrorHighlight.spot(error)
  p(spot.values_at(:first_lineno, :first_column, :last_lineno, :last_column))
  p(spot[:snippet])
end
```

Output:

```
undefined local variable or method 'totl' for main (NameError)

report { total = totl + 1 }
                 ^^^^
Did you mean?  total
--
undefined method 'length' for nil (NoMethodError)

report { order = nil; order.length }
                           ^^^^^^^
--
String can't be coerced into Integer (TypeError)

report { sum = 1 + "2" }
                   ^^^
--
wrong number of arguments (given 1, expected 2) (ArgumentError)

    caller: FILE:18
    | report { shipping_cost(4) }
               ^^^^^^^^^^^^^
    callee: FILE:8
    | def shipping_cost(weight, zone) = weight * zone
          ^^^^^^^^^^^^^
--
undefined method '[]' for nil (NoMethodError)

report { rows = nil; rows[0] }
                         ^^^
--
undefined method 'label=' for nil (NoMethodError)

report { nil.label = "fragile" }
            ^^^^^^^^
--
undefined method 'nope' for an instance of Integer (NoMethodError)

report { [1].map(&:nope) }
            ^^^^
--
undefined method 'round' for nil (NoMethodError)

report { Parcel.new.weight.round(nil) }
                          ^^^^^^
--
no receiver given (ArgumentError)
--
comparison of String with 2 failed (ArgumentError)

report { Comparable.instance_method(:clamp).bind_call(1, "x", 2) }
                                                      ^^^^^^^^^
--
[27, 12, 27, 19]
"  Parcel.new.volume\n"
```
