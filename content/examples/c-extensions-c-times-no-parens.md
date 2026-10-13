---
title: "c_extensions/c_times_no_parens.rb"
slug: c-extensions-c-times-no-parens
description: "The metorex example program c_extensions/c_times_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_times_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_times_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A C extension making Times from seconds and a fraction, and reading Times
# and numbers of seconds back as a struct timeval or struct timespec.
require "tmpdir"
require_relative "build_helper"

class Halves
  def divmod _unit
    [3, Rational(1, 2)]
  end
end

class Broken
  def divmod _unit
    7
  end
end

directory = Dir.mktmpdir
require build_extension("c_times.c", "c_times", directory)
times = CTimes.new

micro = times.from_micro 100, 2_500_000
p [micro.to_i, micro.usec, micro.utc?]
nano = times.from_nano 100, -1
p [nano.to_i, nano.nsec]
p(times.from_number(1.5, 7200).then { |made| [made.to_i, made.nsec, made.utc_offset] })
p times.from_number(10, "UTC").utc?
p(times.from_number(Rational(7, 2), nil).then { |made| [made.to_i, made.nsec] })
p(times.from_timespec(5, 7, 3600).then { |made| [made.to_i, made.nsec, made.utc_offset, made.utc?] })
p times.from_timespec(5, 7, 0x7ffffffe).utc?
p(times.from_timespec(5, 7, 0x7fffffff).then { |made| [made.to_i, made.utc?] })
report { times.from_timespec 5, 7, 86400 }
p (times.now - Time.now).abs < 5

p times.interval 12
p times.interval 1.25
p times.interval Rational(5, 4)
report { times.interval(-1) }
report { times.interval(-0.5) }
report { times.interval Rational(-1, 2) }
report { times.interval Time.at(0) }
p times.timeval(-1.5)
p times.timespec(-1.5)
p times.timespec 0.9999999999
p times.timespec(-2.0)
p times.timespec Rational(-3, 2)
p times.timespec Halves.new
p times.timespec Time.at(4, 250, :nsec)
p times.timeval Time.at(4, 250_000, :nsec)
report { times.timespec 1e30 }
report { times.timespec "10" }
report { times.timespec nil }
report { times.timespec Broken.new }

p times.push_onto([1], 2)
report { times.push_onto [].freeze, 1 }

FileUtils.rm_rf directory
```

Output:

```
[102, 500000, false]
[99, 999999999]
[1, 500000000, 7200]
true
[3, 500000000]
[5, 7, 3600, false]
true
[5, false]
ArgumentError: utc_offset out of range
true
[12, 0]
[1, 250000]
[1, 250000]
ArgumentError: time interval must not be negative
ArgumentError: time interval must not be negative
ArgumentError: time interval must not be negative
TypeError: can't convert Time into time interval
[-2, 500000]
[-2, 500000000]
[1, 0]
[-2, 0]
[-2, 500000000]
[3, 500000000]
[4, 250]
[4, 250]
RangeError: 1000000000000000019884624838656.000000 out of Time range
TypeError: can't convert String into time
TypeError: can't convert nil into time
TypeError: can't convert Broken into time
[1, 2]
FrozenError: can't modify frozen Array: []
```
