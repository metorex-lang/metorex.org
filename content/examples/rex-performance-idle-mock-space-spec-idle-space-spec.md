---
title: "rex/performance/idle_mock_space/spec/idle_space_spec.rb"
slug: rex-performance-idle-mock-space-spec-idle-space-spec
description: "The metorex example program rex/performance/idle_mock_space/spec/idle_space_spec.rb and its output."
---

`tests/_examples/rex/performance/idle_mock_space/spec/idle_space_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/performance/idle_mock_space/spec/idle_space_spec.rb).

```metorex
RSpec.configure { |config| config.order = :defined }

$walks = 0
$walk_trace = TracePoint.new(:call) { |tp| $walks += 1 if %i[verify_all reset_all].include?(tp.method_id) }

class Ledger
  def total = 42
end

RSpec.describe "examples with no doubles" do
  before(:context) { $walk_trace.enable }

  it("sums") { expect(1 + 1).to eq(2) }
  it("counts") { expect([1, 2].size).to eq(2) }
end

RSpec.describe "their mock spaces" do
  it "were neither verified nor taken down" do
    $walk_trace.disable
    expect($walks).to eq(0)
  end
end

RSpec.describe "an example with a stub" do
  it("stubs a method") do
    allow_any_instance_of(Ledger).to receive(:total).and_return(7)
    expect(Ledger.new.total).to eq(7)
  end

  it("finds the method put back afterwards") { expect(Ledger.new.total).to eq(42) }
end
```
