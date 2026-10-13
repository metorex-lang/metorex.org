---
title: "rex/runner/options/spec/money_spec.rb"
slug: rex-runner-options-spec-money-spec
description: "The metorex example program rex/runner/options/spec/money_spec.rb and its output."
---

`tests/_examples/rex/runner/options/spec/money_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/runner/options/spec/money_spec.rb).

```metorex
describe Money do
  it "adds cents" do
    expect(Money.new(150) + Money.new(250)).to eq(Money.new(400))
  end

  it "formats dollars" do
    expect(Money.new(1999).to_s).to eq("$19.99")
  end

  context "with zero" do
    it "formats zero" do
      expect(Money.new(0).to_s).to eq("$0.00")
    end
  end
end
```
