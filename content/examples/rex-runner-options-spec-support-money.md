---
title: "rex/runner/options/spec/support/money.rb"
slug: rex-runner-options-spec-support-money
description: "The metorex example program rex/runner/options/spec/support/money.rb and its output."
---

`tests/_examples/rex/runner/options/spec/support/money.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/runner/options/spec/support/money.rb).

```metorex
Money = Struct.new(:cents) do
  def +(other) = Money.new(cents + other.cents)
  def to_s = format("$%.2f", cents / 100.0)
end
```
