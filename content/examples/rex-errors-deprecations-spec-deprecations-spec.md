---
title: "rex/errors/deprecations/spec/deprecations_spec.rb"
slug: rex-errors-deprecations-spec-deprecations-spec
description: "The metorex example program rex/errors/deprecations/spec/deprecations_spec.rb and its output."
---

`tests/_examples/rex/errors/deprecations/spec/deprecations_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/deprecations/spec/deprecations_spec.rb){target=_blank rel=noopener}.

```metorex
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

describe "deprecated usage" do
  5.times do |attempt|
    it "hands a block matcher a value, attempt #{attempt + 1}" do
      counter = [0]
      expect(counter.push(1)).not_to change { counter.size }
    end
  end
end
```
