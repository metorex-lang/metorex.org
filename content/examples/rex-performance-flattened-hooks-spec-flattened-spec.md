---
title: "rex/performance/flattened_hooks/spec/flattened_spec.rb"
slug: rex-performance-flattened-hooks-spec-flattened-spec
description: "The metorex example program rex/performance/flattened_hooks/spec/flattened_spec.rb and its output."
---

`tests/_examples/rex/performance/flattened_hooks/spec/flattened_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/performance/flattened_hooks/spec/flattened_spec.rb).

```metorex
RSpec.describe "hooks around an example" do
  before { @order = [:outer_before] }
  after { $order_after << :outer_after }
  around do |example|
    $order_around = [:outer_around]
    example.run
  end

  context "nested a level down" do
    before { @order << :inner_before }
    after { $order_after = [:inner_after] }
    around do |example|
      $order_around << :inner_around
      example.run
    end

    it "runs the hooks in RSpec's order" do
      expect([@order, $order_around]).to eq([[:outer_before, :inner_before], [:outer_around, :inner_around]])
    end

    it "runs the group's hooks from one list built for it" do
      expect(Rex::Core::FastPaths::FLATTENED_HOOKS.key?(self.class)).to be(true)
    end
  end
end
```
