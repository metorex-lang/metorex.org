---
title: "rex/errors/deprecations_raise/spec/raise_spec.rb"
slug: rex-errors-deprecations-raise-spec-raise-spec
description: "The metorex example program rex/errors/deprecations_raise/spec/raise_spec.rb and its output."
---

`tests/_examples/rex/errors/deprecations_raise/spec/raise_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/deprecations_raise/spec/raise_spec.rb).

```metorex
RSpec.configure(&:raise_errors_for_deprecations!)

describe "deprecations raised as errors" do
  it "fails where the deprecated call is" do
    counter = [0]
    expect(counter.push(1)).not_to change { counter.size }
  end

  it "passes without one" do
    expect(1).to eq(1)
  end
end
```
