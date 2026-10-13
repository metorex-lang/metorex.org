---
title: "rex/site/ledger/spec/ledger_spec.rb"
slug: rex-site-ledger-spec-ledger-spec
description: "The metorex example program rex/site/ledger/spec/ledger_spec.rb and its output."
---

`tests/_examples/rex/site/ledger/spec/ledger_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/site/ledger/spec/ledger_spec.rb){target=_blank rel=noopener}.

```metorex
require_relative "../lib/ledger"

RSpec.describe Ledger do
  subject(:ledger) { Ledger.new }

  it "starts at zero" do
    expect(ledger.balance).to eq(0)
  end

  context "with two entries" do
    before { ledger.record(120).record(-45) }

    it "sums them" do
      expect(ledger.balance).to eq(75)
    end

    it "is not overdrawn" do
      expect(ledger).not_to be_overdrawn
    end
  end

  it "refuses an entry of zero" do
    expect { ledger.record(0) }.to raise_error(ArgumentError, "an entry needs an amount")
  end

  it "rounds a balance" do
    ledger.record(10).record(-3)
    expect(ledger.balance).to eq(6)
  end
end
```
