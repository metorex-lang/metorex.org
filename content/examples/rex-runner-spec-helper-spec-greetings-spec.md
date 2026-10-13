---
title: "rex/runner/spec_helper/spec/greetings_spec.rb"
slug: rex-runner-spec-helper-spec-greetings-spec
description: "The metorex example program rex/runner/spec_helper/spec/greetings_spec.rb and its output."
---

`tests/_examples/rex/runner/spec_helper/spec/greetings_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/runner/spec_helper/spec/greetings_spec.rb){target=_blank rel=noopener}.

```metorex
describe Greetings do
  it "greets by name" do
    expect(Greetings.for("Ada")).to eq("Hello, Ada")
  end
end
```
