---
title: "rex/site/ledger/lib/ledger.rb"
slug: rex-site-ledger-lib-ledger
description: "The metorex example program rex/site/ledger/lib/ledger.rb and its output."
---

`tests/_examples/rex/site/ledger/lib/ledger.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/site/ledger/lib/ledger.rb){target=_blank rel=noopener}.

```metorex
class Ledger
  def initialize
    @entries = []
  end

  def record(amount)
    raise ArgumentError, "an entry needs an amount" if amount.zero?

    @entries << amount
    self
  end

  def balance = @entries.sum

  def overdrawn? = balance.negative?
end
```
