---
title: "dates/points_in_time_no_parens.rb"
slug: dates-points-in-time-no-parens
description: "The metorex example program dates/points_in_time_no_parens.rb and its output."
---

`tests/_examples/dates/points_in_time_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dates/points_in_time_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A Time holds a whole number of seconds since the epoch plus an exact
# fraction of a second, and reads its calendar fields in UTC or in a zone.
moment = Time.utc 2007, 11, 1, 15, 25, 30, 123456

p moment.year
p moment.month
p moment.day
p moment.hour
p moment.min
p moment.sec
p moment.wday
p moment.yday
p moment.usec
p moment.nsec
p moment.subsec
p moment.utc?
p moment.zone
p moment.utc_offset

p moment.to_i
p moment.to_f
p moment.to_r
p moment.to_a

p moment.inspect
p moment.to_s
p moment.asctime
p moment.xmlschema
p moment.xmlschema 3
p moment.strftime "%Y/%m/%d %H:%M:%S"
p moment.deconstruct_keys [:year, :month, :day]

p Time.at(100, 100).to_f
p Time.at(Rational(3, 2)).subsec
p Time.at(10.75).subsec
p (Time.at(100) - Time.at(99))
p (Time.at(100) + 1).to_i
p Time.at(100) == Time.at(100)
p Time.at(100) < Time.at(200)
p Time.at(100).eql? Time.at(100)

p Time.utc(2000, 1, 1).monday?
p Time.utc(2000, 1, 1).saturday?
p Time.utc(1985, 4, 12, 23, 20, 50).round.to_i
p Time.utc(1985, 4, 12, 23, 20, 50).floor.to_i

offset_time = Time.new 2010, 4, 4, 1, 59, 59, 7245
p offset_time.utc_offset
p offset_time.zone
p offset_time.hour
```

Output:

```
2007
11
1
15
25
30
4
305
123456
123456000
(1929/15625)
true
"UTC"
0
1193930730
1193930730.123456
(18655167658179/15625)
[30, 25, 15, 1, 11, 2007, 4, 305, false, "UTC"]
"2007-11-01 15:25:30.123456 UTC"
"2007-11-01 15:25:30 UTC"
"Thu Nov  1 15:25:30 2007"
"2007-11-01T15:25:30Z"
"2007-11-01T15:25:30.123Z"
"2007/11/01 15:25:30"
{year: 2007, month: 11, day: 1}
100.0001
(1/2)
(3/4)
1.0
101
true
true
true
false
true
482196050
482196050
7245
nil
1
```
