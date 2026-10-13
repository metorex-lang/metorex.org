---
title: "rex/performance/native_metadata/spec/native_metadata_spec.rb"
slug: rex-performance-native-metadata-spec-native-metadata-spec
description: "The metorex example program rex/performance/native_metadata/spec/native_metadata_spec.rb and its output."
---

`tests/_examples/rex/performance/native_metadata/spec/native_metadata_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/performance/native_metadata/spec/native_metadata_spec.rb).

```metorex
RSpec.describe "an invoice", :billing do
  populated = 0
  trace = TracePoint.new(:call) { |tp| populated += 1 if tp.method_id == :populate_location_attributes }
  trace.enable

  it "keeps the metadata RSpec writes", currency: :usd do |example|
    metadata = example.metadata
    expect([metadata[:description], metadata[:full_description], metadata[:location],
            metadata[:scoped_id], metadata[:billing], metadata[:currency]]).to eq(
              ["keeps the metadata RSpec writes", "an invoice keeps the metadata RSpec writes",
               "./spec/native_metadata_spec.rb:6", "1:1", true, :usd]
            )
  end

  trace.disable

  it "fills an example's metadata without the Ruby steps" do
    expect(populated).to eq(0)
  end

  it "is a hash the suite can write to" do |example|
    example.metadata[:reviewed] = true
    expect(example.metadata[:reviewed]).to be(true)
  end
end
```
