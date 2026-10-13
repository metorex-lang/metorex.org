---
title: "rex/coverage/project/spec/ledger_spec.rb"
slug: rex-coverage-project-spec-ledger-spec
description: "The metorex example program rex/coverage/project/spec/ledger_spec.rb and its output."
---

`tests/_examples/rex/coverage/project/spec/ledger_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/coverage/project/spec/ledger_spec.rb){target=_blank rel=noopener}.

```metorex
RSpec.describe Ledger do
  it "sums its entries" do
    expect(Ledger.new([5, -2]).balance).to eq(3)
  end

  it "is in credit with a positive balance" do
    expect(Ledger.new([5]).status).to eq(:credit)
  end

  it "labels a ledger with entries" do
    expect(Ledger.new([1, 2]).label).to eq("2 entries")
  end
end

RSpec.describe Fees do
  it "charges a small fee for a small amount" do
    expect(Fees.for(50)).to eq(1)
  end
end
```
