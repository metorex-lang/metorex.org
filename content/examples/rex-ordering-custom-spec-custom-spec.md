---
title: "rex/ordering/custom/spec/custom_spec.rb"
slug: rex-ordering-custom-spec-custom-spec
description: "The metorex example program rex/ordering/custom/spec/custom_spec.rb and its output."
---

`tests/_examples/rex/ordering/custom/spec/custom_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/ordering/custom/spec/custom_spec.rb).

```metorex
RSpec.configure do |config|
  config.register_ordering(:reverse) { |items| items.reverse }
  config.register_ordering(:global) { |items| items.sort_by(&:description) }
end

describe "zebra" do
  it "runs first by name" do
  end

  it "runs second by name" do
  end
end

describe "apple", order: :reverse do
  it "is defined first" do
  end

  it "is defined second" do
  end

  it "is defined third" do
  end
end

describe "mango", order: :unknown do
  it "falls back to the global ordering" do
  end
end
```
