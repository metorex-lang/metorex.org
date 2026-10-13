---
title: "rex/performance/flattened_hooks/spec/redefined_spec.rb"
slug: rex-performance-flattened-hooks-spec-redefined-spec
description: "The metorex example program rex/performance/flattened_hooks/spec/redefined_spec.rb and its output."
---

`tests/_examples/rex/performance/flattened_hooks/spec/redefined_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/performance/flattened_hooks/spec/redefined_spec.rb).

```metorex
$walked = []

Rex::Core::Hooks::HookCollections.class_exec do
  alias_method :rex_run_owned_hooks_for, :run_owned_hooks_for

  def run_owned_hooks_for(position, scope, example_or_group)
    $walked << [position, scope]
    rex_run_owned_hooks_for(position, scope, example_or_group)
  end
end

RSpec.describe "a redefined hook walk" do
  before { @ran = true }

  it "runs the hooks through the redefined method" do
    expect([@ran, $walked.include?([:before, :example])]).to eq([true, true])
  end
end
```
