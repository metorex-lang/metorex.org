---
title: "stdlib/timeout_busy_code.rb"
slug: stdlib-timeout-busy-code
description: "The metorex example program stdlib/timeout_busy_code.rb and its output."
---

`tests/_examples/stdlib/timeout_busy_code.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/timeout_busy_code.rb).

```metorex
# Timeout.timeout raises into its block wherever the block stands, so a
# loop that never waits is stopped too. The error is raised once, and the
# block's ensure clauses run as it unwinds.
require "timeout"

begin
  Timeout.timeout(0.05) { loop {} }
rescue Timeout::Error => error
  p([error.class, error.message])
end

begin
  Timeout.timeout(0.05) { true while true }
rescue Timeout::Error => error
  p([error.class, error.message])
end

begin
  Timeout.timeout(0.05, ArgumentError, "slow") do
    count = 0
    count += 1 while true
  end
rescue ArgumentError => error
  p([error.class, error.message])
end

begin
  Timeout.timeout(0.05) do
    loop {}
  ensure
    p(:ensured)
  end
rescue Timeout::Error
  p(:raised_once)
end

begin
  Timeout.timeout(5) { Timeout.timeout(0.05) { loop {} } }
rescue Timeout::Error
  p(:inner_limit)
end

p(Timeout.timeout(1) { 42 })
```

Output:

```
[Timeout::Error, "execution expired"]
[Timeout::Error, "execution expired"]
[ArgumentError, "slow"]
:ensured
:raised_once
:inner_limit
42
```
