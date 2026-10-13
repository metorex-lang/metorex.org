---
title: "stdlib/timeout_busy_code_no_parens.rb"
slug: stdlib-timeout-busy-code-no-parens
description: "The metorex example program stdlib/timeout_busy_code_no_parens.rb and its output."
---

`tests/_examples/stdlib/timeout_busy_code_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/timeout_busy_code_no_parens.rb).

```metorex
# Timeout.timeout raises into its block wherever the block stands, so a
# loop that never waits is stopped too. The error is raised once, and the
# block's ensure clauses run as it unwinds.
require "timeout"

begin
  Timeout.timeout 0.05 do loop {} end
rescue Timeout::Error => error
  p [error.class, error.message]
end

begin
  Timeout.timeout 0.05 do true while true end
rescue Timeout::Error => error
  p [error.class, error.message]
end

begin
  Timeout.timeout 0.05, ArgumentError, "slow" do
    count = 0
    count += 1 while true
  end
rescue ArgumentError => error
  p [error.class, error.message]
end

begin
  Timeout.timeout 0.05 do
    loop {}
  ensure
    p :ensured
  end
rescue Timeout::Error
  p :raised_once
end

begin
  Timeout.timeout 5 do Timeout.timeout 0.05 do loop {} end end
rescue Timeout::Error
  p :inner_limit
end

answered = Timeout.timeout 1 do 42 end
p answered
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
