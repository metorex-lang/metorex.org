---
title: "rex/config/fast_paths/spec/fast_paths_spec.rb"
slug: rex-config-fast-paths-spec-fast-paths-spec
description: "The metorex example program rex/config/fast_paths/spec/fast_paths_spec.rb and its output."
---

`tests/_examples/rex/config/fast_paths/spec/fast_paths_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/config/fast_paths/spec/fast_paths_spec.rb).

```metorex
RSpec.describe "the fast paths setting" do
  it "reads what the command line or the configuration set" do
    puts "fast paths: #{RSpec.configuration.fast_paths?}"
    expect([true, false]).to include(RSpec.configuration.fast_paths)
  end
end
```
