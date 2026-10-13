---
title: "rex/runner/plain_script/ledger_autorun.rb"
slug: rex-runner-plain-script-ledger-autorun
description: "The metorex example program rex/runner/plain_script/ledger_autorun.rb and its output."
---

`tests/_examples/rex/runner/plain_script/ledger_autorun.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/runner/plain_script/ledger_autorun.rb).

```metorex
require "rspec/autorun"

RSpec.describe "a ledger" do
  it "sums its entries" do
    expect([12, 30].sum).to eq(42)
  end

  it "rounds a total" do
    expect(10.0 / 4).to eq(2)
  end
end
```
