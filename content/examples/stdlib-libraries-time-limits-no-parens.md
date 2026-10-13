---
title: "stdlib_libraries/time_limits_no_parens.rb"
slug: stdlib-libraries-time-limits-no-parens
description: "The metorex example program stdlib_libraries/time_limits_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/time_limits_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/time_limits_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A block given a limit on how long it may run, and the collector's settings.
require "timeout"

p Timeout.timeout(1) { 42 }

begin
  Timeout.timeout 1 do
    sleep
  end
rescue Timeout::Error => expired
  p [expired.class, expired.message]
end

begin
  Timeout.timeout 1, ArgumentError, "took too long" do
    sleep 5
  end
rescue ArgumentError => expired
  p expired.message
end

begin
  Timeout.timeout -1 do
    :never
  end
rescue ArgumentError => refused
  p refused.message
end

# A limit ends with its block, so a later wait is not cut short by it.
p Timeout.timeout(0.01) { :inside }
p sleep 0.05

settings = GC.config
p settings[:implementation].is_a? String
p GC.config(foo: "bar") == settings
```

Output:

```
42
[Timeout::Error, "execution expired"]
"took too long"
"Timeout sec must be a non-negative number"
:inside
0
true
true
```
