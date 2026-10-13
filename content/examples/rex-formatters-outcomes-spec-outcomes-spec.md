---
title: "rex/formatters/outcomes/spec/outcomes_spec.rb"
slug: rex-formatters-outcomes-spec-outcomes-spec
description: "The metorex example program rex/formatters/outcomes/spec/outcomes_spec.rb and its output."
---

`tests/_examples/rex/formatters/outcomes/spec/outcomes_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/formatters/outcomes/spec/outcomes_spec.rb).

```metorex
describe "a cart" do
  it "starts empty" do
    expect([]).to be_empty
  end

  it "adds an item" do
    expect([:apple].size).to eq(2)
  end

  it "applies a coupon" do
    pending "the coupon rules"
    expect(10 - 1).to eq(8)
  end

  it "ships to a second address"

  context "when checking out" do
    it "charges the card" do
      expect("charged").to start_with("char")
    end

    it "sends a receipt" do
      raise ArgumentError, "no email address on file"
    end
  end
end
```
