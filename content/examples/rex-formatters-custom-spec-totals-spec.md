---
title: "rex/formatters/custom/spec/totals_spec.rb"
slug: rex-formatters-custom-spec-totals-spec
description: "The metorex example program rex/formatters/custom/spec/totals_spec.rb and its output."
---

`tests/_examples/rex/formatters/custom/spec/totals_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/formatters/custom/spec/totals_spec.rb){target=_blank rel=noopener}.

```metorex
require "spec_helper"

describe "an account" do
  it "opens" do
    expect(:open).to eq(:open)
  end

  it "closes" do
    expect(:open).to eq(:closed)
  end

  it "freezes", skip: "the freeze rule" do
  end
end
```
