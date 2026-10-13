---
title: "rex/parallel/shared_state/spec/state_spec.rb"
slug: rex-parallel-shared-state-spec-state-spec
description: "The metorex example program rex/parallel/shared_state/spec/state_spec.rb and its output."
---

`tests/_examples/rex/parallel/shared_state/spec/state_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/parallel/shared_state/spec/state_spec.rb){target=_blank rel=noopener}.

```metorex
RSpec.describe "a settings writer" do
  it "turns on the dark theme" do
    $theme = :dark
  end
end

RSpec.describe "a settings reader" do
  it "sees the theme the writer set" do
    expect($theme).to eq(:dark)
  end
end
```
