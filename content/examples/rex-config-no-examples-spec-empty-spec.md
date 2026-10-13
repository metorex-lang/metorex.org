---
title: "rex/config/no_examples/spec/empty_spec.rb"
slug: rex-config-no-examples-spec-empty-spec
description: "The metorex example program rex/config/no_examples/spec/empty_spec.rb and its output."
---

`tests/_examples/rex/config/no_examples/spec/empty_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/config/no_examples/spec/empty_spec.rb).

```metorex
RSpec.configure { |config| config.fail_if_no_examples = true }

RSpec.describe "a group with every example filtered out" do
  it "is slow", :slow do
  end
end
```
