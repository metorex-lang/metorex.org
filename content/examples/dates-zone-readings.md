---
title: "dates/zone_readings.rb"
slug: dates-zone-readings
description: "The metorex example program dates/zone_readings.rb and its output."
---

`tests/_examples/dates/zone_readings.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dates/zone_readings.rb){target=_blank rel=noopener}.

```metorex
# A Time may be read in a zone named as an offset, as one of the military
# letters, or through an object that converts between its own readings and
# UTC. `strftime` writes every directive Ruby writes, flags and all.
held = Time.utc 2001, 2, 3, 4, 5, 6

p held.strftime("%Y-%m-%d %H:%M:%S")
p held.strftime("%v")
p held.strftime("%c")
p held.strftime("%-m/%-d/%-y")
p held.strftime("%^h and %0^5h and %_5h")
p held.strftime("%j %U %W %V %G")
p held.strftime("%z %:z %::z")
p held.strftime("%I%P %l%p")

# A time read against a fixed offset writes that offset.
shifted = Time.new 2001, 2, 3, 4, 5, 6, "+05:30"
p shifted.utc_offset
p shifted.strftime("%z")

# One of the military letters names an offset of whole hours.
p Time.at(0, in: "W").utc_offset
p Time.at(0, in: "A").utc_offset

# A whole date written out is read back the way it was written.
p Time.new("2020-12-25T00:56:17+09:00").utc.strftime("%F %T")
p Time.new("2020-12-25T00:56:17.123456+09:00").subsec
p Time.new("2021").strftime("%F")

# A zone of its own converts between its readings and UTC.
class FixedZone
  def initialize(offset)
    @offset = offset
  end

  def utc_to_local(time)
    time + @offset
  end

  def local_to_utc(time)
    time - @offset
  end

  def abbr(_time)
    "FIX"
  end
end

zoned = Time.at 0, in: FixedZone.new(3600)
p zoned.utc_offset
p zoned.strftime("%Z")
```

Output:

```
"2001-02-03 04:05:06"
" 3-FEB-2001"
"Sat Feb  3 04:05:06 2001"
"2/3/1"
"FEB and 00FEB and   Feb"
"034 04 05 05 2001"
"+0000 +00:00 +00:00:00"
"04am  4AM"
19800
"+0530"
-36000
3600
"2020-12-24 15:56:17"
(1929/15625)
"2021-01-01"
3600
"FIX"
```
