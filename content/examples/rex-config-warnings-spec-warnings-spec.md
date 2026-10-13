---
title: "rex/config/warnings/spec/warnings_spec.rb"
slug: rex-config-warnings-spec-warnings-spec
description: "The metorex example program rex/config/warnings/spec/warnings_spec.rb and its output."
---

`tests/_examples/rex/config/warnings/spec/warnings_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/config/warnings/spec/warnings_spec.rb).

```metorex
RSpec.configure { |config| config.raise_on_warning = true }

RSpec.describe "a warning" do
  it "is raised as an error" do
    expect { raise ArgumentError }.to raise_error
  end

  it "is not raised for a specific error class" do
    expect { raise ArgumentError }.to raise_error(ArgumentError)
  end
end
```
