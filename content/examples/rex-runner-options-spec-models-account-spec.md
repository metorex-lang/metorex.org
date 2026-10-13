---
title: "rex/runner/options/spec/models/account_spec.rb"
slug: rex-runner-options-spec-models-account-spec
description: "The metorex example program rex/runner/options/spec/models/account_spec.rb and its output."
---

`tests/_examples/rex/runner/options/spec/models/account_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/runner/options/spec/models/account_spec.rb){target=_blank rel=noopener}.

```metorex
require "account"

describe Account do
  it "starts empty" do
    expect(Account.new.balance).to eq(Money.new(0))
  end

  it "rounds wrong" do
    expect(Account.new.balance.to_s).to eq("$0.01")
  end
end
```
