---
title: "stdlib/marshal_core_values_no_parens.rb"
slug: stdlib-marshal-core-values-no-parens
description: "The metorex example program stdlib/marshal_core_values_no_parens.rb and its output."
---

`tests/_examples/stdlib/marshal_core_values_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/marshal_core_values_no_parens.rb).

```metorex
# Marshal writes exceptions, ranges, times and wide numbers the way Ruby
# does, and reads them back whole.
failure = RuntimeError.new("disk full")
failure.set_backtrace ["store.rb:12"]
failure.instance_variable_set :@retries, 3
p Marshal.dump(failure)

begin
  begin
    raise ArgumentError, "bad size"
  rescue ArgumentError
    raise RuntimeError, "write failed"
  end
rescue RuntimeError => raised
  back = Marshal.load(Marshal.dump(raised))
  p [back.class, back.message, back.cause.class, back.cause.message]
end

p Marshal.dump(1..2)
p Marshal.dump(1...2)
p Marshal.load(Marshal.dump(3...9))

moment = Time.utc(2012, 1, 1)
p Marshal.dump(moment)
p Marshal.load(Marshal.dump(moment)) == moment

wide = 2**64
p Marshal.dump([wide, wide])

p Exception.allocate.message
```

Output:

```
"\x04\bo:\x11RuntimeError\b:\tmesgI\"\x0Edisk full\x06:\x06ET:\abt[\x06I\"\x10store.rb:12\x06;\aT:\r@retriesi\b"
[RuntimeError, "write failed", ArgumentError, "bad size"]
"\x04\bo:\nRange\b:\texclF:\nbegini\x06:\bendi\a"
"\x04\bo:\nRange\b:\texclT:\nbegini\x06:\bendi\a"
3...9
"\x04\bIu:\tTime\r \x00\x1C\xC0\x00\x00\x00\x00\x06:\tzoneI\"\bUTC\x06:\x06EF"
true
"\x04\b[\al+\n\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00@\x06"
"Exception"
```
