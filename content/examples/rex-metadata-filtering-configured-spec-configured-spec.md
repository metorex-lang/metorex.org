---
title: "rex/metadata/filtering/configured/spec/configured_spec.rb"
slug: rex-metadata-filtering-configured-spec-configured-spec
description: "The metorex example program rex/metadata/filtering/configured/spec/configured_spec.rb and its output."
---

`tests/_examples/rex/metadata/filtering/configured/spec/configured_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/metadata/filtering/configured/spec/configured_spec.rb){target=_blank rel=noopener}.

```metorex
RSpec.configure do |config|
  config.filter_run_excluding broken: true
  config.filter_run_excluding version: ->(version) { version > 3 }
end

describe "configured filters" do
  it "runs" do
    expect(1).to eq(1)
  end

  it "is excluded as broken", :broken do
    raise "never runs"
  end

  it "runs on an old version", version: 2 do
    expect(2).to eq(2)
  end

  it "is excluded on a new version", version: 4 do
    raise "never runs"
  end
end
```
