---
title: "rex/ordering/bisect/spec/settings_spec.rb"
slug: rex-ordering-bisect-spec-settings-spec
description: "The metorex example program rex/ordering/bisect/spec/settings_spec.rb and its output."
---

`tests/_examples/rex/ordering/bisect/spec/settings_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/ordering/bisect/spec/settings_spec.rb){target=_blank rel=noopener}.

```metorex
SETTINGS = { currency: "USD" }

describe "settings" do
  it "reads the default currency" do
    expect(SETTINGS[:currency]).to eq("USD")
  end

  it "formats an amount" do
    expect(format("%.2f", 3)).to eq("3.00")
  end

  it "switches the currency" do
    SETTINGS[:currency] = "EUR"
    expect(SETTINGS[:currency]).to eq("EUR")
  end

  it "counts the line items" do
    expect([1, 2, 3].size).to eq(3)
  end

  it "rounds a total" do
    expect(2.555.round(1)).to eq(2.6)
  end

  it "joins the names" do
    expect(%w[a b].join(",")).to eq("a,b")
  end
end
```
