---
title: "rex/performance/native_group_instances/spec/own_initialize_spec.rb"
slug: rex-performance-native-group-instances-spec-own-initialize-spec
description: "The metorex example program rex/performance/native_group_instances/spec/own_initialize_spec.rb and its output."
---

`tests/_examples/rex/performance/native_group_instances/spec/own_initialize_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/performance/native_group_instances/spec/own_initialize_spec.rb).

```metorex
RSpec.describe "a group that defines initialize" do
  def initialize(*)
    super
    @opened_with = :initialize
  end

  let(:total) { 42 }

  it "runs its own initialize for each example" do
    expect([@opened_with, total]).to eq([:initialize, 42])
  end
end
```
