---
title: "dates/times_from_parts_no_parens.rb"
slug: dates-times-from-parts-no-parens
description: "The metorex example program dates/times_from_parts_no_parens.rb and its output."
---

`tests/_examples/dates/times_from_parts_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dates/times_from_parts_no_parens.rb).

```metorex
# A time may be built from its calendar parts, with a numeral spelled out
# reading as base ten and the month named in words or in digits.
puts Time.utc(2000, 1, 1, 20, 15, 1).to_s
puts Time.utc("2000", "08", "08", "08", "08", "08").to_s
puts Time.utc(2000, "dec").to_s

# Ten arguments name the parts the way the C library writes them, seconds
# first and the year sixth.
puts Time.utc(1, 15, 20, 1, 1, 2000, 0, 0, false, "UTC").to_s

# A count of microseconds stands for the whole fraction of the second.
made = Time.utc 2000, 1, 1, 20, 15, 1.75, 2
puts made.sec.to_s
puts made.usec.to_s

begin
  Time.utc 2008, 16, 31
rescue ArgumentError => problem
  puts problem.message
end
```

Output:

```
2000-01-01 20:15:01 UTC
2000-08-08 08:08:08 UTC
2000-12-01 00:00:00 UTC
2000-01-01 20:15:01 UTC
1
2
mon out of range
```
