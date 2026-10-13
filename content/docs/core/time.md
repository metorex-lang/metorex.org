---
title: "Time"
slug: time
description: "The methods ruby/spec describes in core/time, and which Metorex implements."
---

ruby/spec describes 68 methods in `core/time`, and Metorex implements 68 of them. The parameters are what `Method#parameters` answers under Metorex.

## Encoding

- **`Encoding.default_internal`**: implemented, parameters `[[:req, :args]]`. Returns default internal encoding. [An example calling it](/examples/encodings-missing-converters).

## Time

- **`Time#+`**: implemented, parameters `[[:req, :other]]`. Returns a new `Time` object whose value is the sum of the numeric value of `self` and the given `numeric`:
- **`Time#-`**: implemented, parameters `[[:req, :other]]`. When `numeric` is given, returns a new `Time` object whose value is the difference of the numeric value of `self` and `numeric`:
- **`Time#<=>`**: implemented, parameters `[[:req, :other]]`. Compares `self` with `other_time`; returns:
- **`Time#_dump`**: implemented, parameters `[[:opt, :_limit]]`.
- **`Time._load`**: implemented, parameters `[[:req, :written]]`.
- **`Time#asctime`**: implemented, parameters `[]`. Returns a string representation of `self`, formatted by <code>strftime('%a %b %e %T %Y')</code> or its shorthand version <code>strftime('%c')</code>; see Formats for Dates and Times: [An example calling it](/examples/dates-points-in-time).
- **`Time.at`**: implemented, parameters `[[:req, :seconds], [:rest, :rest], [:keyrest, :options]]`. Returns a new `Time` object based on the given arguments. [An example calling it](/examples/builtins-operators-by-name).
- **`Time#ceil`**: implemented, parameters `[[:opt, :digits]]`. Returns a new `Time` object whose numerical value is greater than or equal to `self` with its seconds truncated to precision `ndigits`: [An example calling it](/examples/basics-floats-methods).
- **`Time#ctime`**: implemented, parameters `[]`. Returns a string representation of `self`, formatted by <code>strftime('%a %b %e %T %Y')</code> or its shorthand version <code>strftime('%c')</code>; see Formats for Dates and Times:
- **`Time#day`**: implemented, parameters `[]`. Returns the integer day of the month for `self`, in range (1..31): [An example calling it](/examples/dates-calendar-days).
- **`Time#deconstruct_keys`**: implemented, parameters `[[:req, :keys]]`. Returns a hash of the name/value pairs, to use in pattern matching. [An example calling it](/examples/data-objects-data-member-keys).
- **`Time#dst?`**: implemented, parameters `[]`. Returns `true` if `self` is in daylight saving time, `false` otherwise:
- **`Time#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Time#eql?`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `self` and `other_time` are both `Time` objects with the exact same time value. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Time#floor`**: implemented, parameters `[[:opt, :digits]]`. Returns a new `Time` object whose numerical value is less than or equal to `self` with its seconds truncated to precision `ndigits`: [An example calling it](/examples/basics-floats-methods).
- **`Time#friday?`**: implemented, parameters `[]`. Returns `true` if `self` represents a Friday, `false` otherwise:
- **`Time#getgm`**: implemented, parameters `[]`. Returns a new `Time` object representing the value of `self` converted to the UTC timezone:
- **`Time#getlocal`**: implemented, parameters `[[:opt, :offset]]`. Returns a new `Time` object representing the value of `self` converted to a given timezone; if `zone` is `nil`, the local timezone is used: [An example calling it](/examples/dates-time-zone-parsing).
- **`Time#getutc`**: implemented, parameters `[]`. Returns a new `Time` object representing the value of `self` converted to the UTC timezone:
- **`Time.gm`**: implemented, parameters `[[:rest, :args]]`. Returns a new `Time` object based the on given arguments, in the UTC timezone.
- **`Time#gmt?`**: implemented, parameters `[]`. Returns `true` if `self` represents a time in UTC (GMT):
- **`Time#gmt_offset`**: implemented, parameters `[]`. Returns the offset in seconds between the timezones of UTC and `self`:
- **`Time#gmtime`**: implemented, parameters `[]`. Returns `self`, converted to the UTC timezone: [An example calling it](/examples/dates-marshal-bytes).
- **`Time#gmtoff`**: implemented, parameters `[]`. Returns the offset in seconds between the timezones of UTC and `self`:
- **`Time#hash`**: implemented, parameters `[]`. Returns the integer hash code for `self`. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Time#hour`**: implemented, parameters `[]`. Returns the integer hour of the day for `self`, in range (0..23): [An example calling it](/examples/dates-clock-and-calendar).
- **`Time#inspect`**: implemented, parameters `[]`. Returns a string representation of `self` with subseconds: [An example calling it](/examples/runtime-daemonizing).
- **`Time#isdst`**: implemented, parameters `[]`. Returns `true` if `self` is in daylight saving time, `false` otherwise:
- **`Time#iso8601`**: implemented, parameters `[[:opt, :fraction]]`. Parses `time` as a dateTime defined by the XML Schema and converts it to a Time object. [An example calling it](/examples/builtins-core-state-and-time).
- **`Time.local`**: implemented, parameters `[[:rest, :args]]`. Like Time.utc, except that the returned `Time` object has the local timezone, not the UTC timezone:
- **`Time#localtime`**: implemented, parameters `[[:opt, :offset]]`. With no argument given: [An example calling it](/examples/dates-zone-names-utc).
- **`Time#mday`**: implemented, parameters `[]`. Returns the integer day of the month for `self`, in range (1..31):
- **`Time#min`**: implemented, parameters `[]`. Returns the integer minute of the hour for `self`, in range (0..59): [An example calling it](/examples/array-methods-counted-min-max).
- **`Time.mktime`**: implemented, parameters `[[:rest, :args]]`. Like Time.utc, except that the returned `Time` object has the local timezone, not the UTC timezone:
- **`Time#mon`**: implemented, parameters `[]`. Returns the integer month of the year for `self`, in range (1..12):
- **`Time#monday?`**: implemented, parameters `[]`. Returns `true` if `self` represents a Monday, `false` otherwise: [An example calling it](/examples/dates-points-in-time).
- **`Time#month`**: implemented, parameters `[]`. Returns the integer month of the year for `self`, in range (1..12): [An example calling it](/examples/dates-calendar-days).
- **`Time.new`**: implemented, parameters `[[:rest, :args], [:keyrest, :options]]`. Returns a new `Time` object based on the given arguments, by default in the local timezone. [An example calling it](/examples/dates-points-in-time).
- **`Time.now`**: implemented, parameters `[[:keyrest, :options]]`. Creates a new `Time` object from the current system time. [An example calling it](/examples/c-extensions-c-objects).
- **`Time#nsec`**: implemented, parameters `[]`. Returns the number of nanoseconds in the subseconds part of `self` in the range (0..999_999_999); lower-order digits are truncated, not rounded: [An example calling it](/examples/c-extensions-c-times).
- **`Time#round`**: implemented, parameters `[[:opt, :digits]]`. Returns a new `Time` object whose numeric value is that of `self`, with its seconds value rounded to precision `ndigits`: [An example calling it](/examples/runtime-instances).
- **`Time#saturday?`**: implemented, parameters `[]`. Returns `true` if `self` represents a Saturday, `false` otherwise: [An example calling it](/examples/dates-points-in-time).
- **`Time#sec`**: implemented, parameters `[]`. Returns the integer second of the minute for `self`, in range (0..60): [An example calling it](/examples/dates-clock-and-calendar).
- **`Time#strftime`**: implemented, parameters `[[:req, :template]]`. Returns a string representation of `self`, formatted according to the given string `format`. [An example calling it](/examples/dates-calendar-days).
- **`Time#subsec`**: implemented, parameters `[]`. Returns the exact subseconds for `self` as a Numeric (Integer or Rational): [An example calling it](/examples/builtins-core-state-and-time).
- **`Time#sunday?`**: implemented, parameters `[]`. Returns `true` if `self` represents a Sunday, `false` otherwise:
- **`Time#thursday?`**: implemented, parameters `[]`. Returns `true` if `self` represents a Thursday, `false` otherwise:
- **`Time#to_a`**: implemented, parameters `[]`. Returns a 10-element array of values representing `self`: [An example calling it](/examples/advanced-threads-wait-on-streams).
- **`Time#to_f`**: implemented, parameters `[]`. Returns the value of `self` as a Float number Epoch seconds; subseconds are included. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Time#to_i`**: implemented, parameters `[]`. Returns the value of `self` as integer Epoch seconds; subseconds are truncated (not rounded): [An example calling it](/examples/runtime-io-popen).
- **`Time#to_r`**: implemented, parameters `[]`. Returns the value of `self` as a Rational exact number of Epoch seconds; `Time.now.to_r # => (16571402750320203/10000000)`. [An example calling it](/examples/basics-floats-methods).
- **`Time#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`, without subseconds: [An example calling it](/examples/runtime-builtin-classes).
- **`Time#tuesday?`**: implemented, parameters `[]`. Returns `true` if `self` represents a Tuesday, `false` otherwise:
- **`Time#tv_nsec`**: implemented, parameters `[]`. Returns the number of nanoseconds in the subseconds part of `self` in the range (0..999_999_999); lower-order digits are truncated, not rounded:
- **`Time#tv_sec`**: implemented, parameters `[]`. Returns the value of `self` as integer Epoch seconds; subseconds are truncated (not rounded):
- **`Time#tv_usec`**: implemented, parameters `[]`. Returns the number of microseconds in the subseconds part of `self` in the range (0..999_999); lower-order digits are truncated, not rounded:
- **`Time#usec`**: implemented, parameters `[]`. Returns the number of microseconds in the subseconds part of `self` in the range (0..999_999); lower-order digits are truncated, not rounded: [An example calling it](/examples/c-extensions-c-times).
- **`Time#utc`**: implemented, parameters `[]`. Returns `self`, converted to the UTC timezone: [An example calling it](/examples/builtins-operators-by-name).
- **`Time.utc`**: implemented, parameters `[[:rest, :args]]`. Returns a new `Time` object based the on given arguments, in the UTC timezone. [An example calling it](/examples/builtins-string-encodings).
- **`Time#utc?`**: implemented, parameters `[]`. Returns `true` if `self` represents a time in UTC (GMT): [An example calling it](/examples/c-extensions-c-times).
- **`Time#utc_offset`**: implemented, parameters `[]`. Returns the offset in seconds between the timezones of UTC and `self`: [An example calling it](/examples/c-extensions-c-times).
- **`Time#wday`**: implemented, parameters `[]`. Returns the integer day of the week for `self`, in range (0..6), with Sunday as zero. [An example calling it](/examples/dates-calendar-days).
- **`Time#wednesday?`**: implemented, parameters `[]`. Returns `true` if `self` represents a Wednesday, `false` otherwise: [An example calling it](/examples/dates-calendar-days).
- **`Time#xmlschema`**: implemented, parameters `[[:opt, :fraction]]`. Returns a string which represents the time as a dateTime defined by XML Schema: [An example calling it](/examples/dates-points-in-time).
- **`Time#yday`**: implemented, parameters `[]`. Returns the integer day of the year of `self`, in range (1..366). [An example calling it](/examples/dates-calendar-days).
- **`Time#year`**: implemented, parameters `[]`. Returns the integer year for `self`: [An example calling it](/examples/dates-calendar-days).
- **`Time#zone`**: implemented, parameters `[]`. Returns the string name of the time zone for `self`: [An example calling it](/examples/dates-clock-and-calendar).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
