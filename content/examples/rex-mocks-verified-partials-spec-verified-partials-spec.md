---
title: "rex/mocks/verified_partials/spec/verified_partials_spec.rb"
slug: rex-mocks-verified-partials-spec-verified-partials-spec
description: "The metorex example program rex/mocks/verified_partials/spec/verified_partials_spec.rb and its output."
---

`tests/_examples/rex/mocks/verified_partials/spec/verified_partials_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/mocks/verified_partials/spec/verified_partials_spec.rb).

```metorex
class Ledger
  def record(entry, amount = 0) = [entry, amount]
  def self.open = new
end

describe "verified partial doubles" do
  it "rejects a method the class does not define" do
    allow(Ledger).to receive(:close)
  end

  it "rejects the wrong number of arguments on a real object" do
    ledger = Ledger.new
    allow(ledger).to receive(:record)
    ledger.record
  end

  it "accepts a method the class defines" do
    allow(Ledger).to receive(:open).and_return(:opened)
    expect(Ledger.open).to eq(:opened)
  end
end
```
