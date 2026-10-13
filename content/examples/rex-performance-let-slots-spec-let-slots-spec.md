---
title: "rex/performance/let_slots/spec/let_slots_spec.rb"
slug: rex-performance-let-slots-spec-let-slots-spec
description: "The metorex example program rex/performance/let_slots/spec/let_slots_spec.rb and its output."
---

`tests/_examples/rex/performance/let_slots/spec/let_slots_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/performance/let_slots/spec/let_slots_spec.rb).

```metorex
RSpec.describe "a let read more than once" do
  let(:total) { [12, 30].sum }

  it "is computed once and read from its slot after that" do
    lookups = 0
    trace = TracePoint.new(:call) { |tp| lookups += 1 if tp.method_id == :fetch_or_store }
    trace.enable { 3.times { total } }
    expect([total, lookups]).to eq([42, 1])
  end
end
```
