---
title: "rex/coverage/project/lib/ledger.rb"
slug: rex-coverage-project-lib-ledger
description: "The metorex example program rex/coverage/project/lib/ledger.rb and its output."
---

`tests/_examples/rex/coverage/project/lib/ledger.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/coverage/project/lib/ledger.rb).

```metorex
class Ledger
  def initialize(entries)
    @entries = entries
  end

  def balance
    @entries.sum
  end

  def status
    if balance.positive?
      :credit
    elsif balance.zero?
      :even
    else
      :debit
    end
  end

  def largest
    @entries.max
  end

  def label
    @entries.empty? ? "empty" : "#{@entries.size} entries"
  end
end
```
