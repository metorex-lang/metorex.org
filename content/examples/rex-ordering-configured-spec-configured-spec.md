---
title: "rex/ordering/configured/spec/configured_spec.rb"
slug: rex-ordering-configured-spec-configured-spec
description: "The metorex example program rex/ordering/configured/spec/configured_spec.rb and its output."
---

`tests/_examples/rex/ordering/configured/spec/configured_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/ordering/configured/spec/configured_spec.rb).

```metorex
RSpec.configure do |config|
  config.order = :random
  config.seed = 7
end

describe "first group" do
  it "runs one" do
  end

  it "runs two" do
  end

  it "runs three" do
  end
end

describe "second group" do
  it "runs four" do
  end

  it "runs five" do
  end
end
```
