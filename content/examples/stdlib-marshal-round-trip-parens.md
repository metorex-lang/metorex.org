---
title: "stdlib/marshal_round_trip_parens.rb"
slug: stdlib-marshal-round-trip-parens
description: "The metorex example program stdlib/marshal_round_trip_parens.rb and its output."
---

`tests/_examples/stdlib/marshal_round_trip_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/marshal_round_trip_parens.rb).

```metorex
# `Marshal.dump` writes an object as the bytes Ruby's marshal format spells
# it in, and `Marshal.load` puts it back together.
p(Marshal.dump(0.5).bytes)
p(Marshal.dump(42).bytes)
p(Marshal.load(Marshal.dump([1, "two", :three, { four: 4 }])))
p(Marshal.load(Marshal.dump(nil)))
p(Marshal.load(Marshal.dump(2**70)) == 2**70)

class Waypoint
  attr_reader :name, :miles

  def initialize(name, miles)
    @name = name
    @miles = miles
  end
end

back = Marshal.load(Marshal.dump(Waypoint.new("summit", 12)))
p(back.class)
p(back.name)
p(back.miles)

held = Marshal.load(Marshal.dump("keeps its encoding"))
p(held.encoding)
```

Output:

```
[4, 8, 102, 8, 48, 46, 53]
[4, 8, 105, 47]
[1, "two", :three, {four: 4}]
nil
true
Waypoint
"summit"
12
#<Encoding:UTF-8>
```
