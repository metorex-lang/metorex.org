---
title: "rex/performance/native_metadata/spec/redefined_spec.rb"
slug: rex-performance-native-metadata-spec-redefined-spec
description: "The metorex example program rex/performance/native_metadata/spec/redefined_spec.rb and its output."
---

`tests/_examples/rex/performance/native_metadata/spec/redefined_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/performance/native_metadata/spec/redefined_spec.rb).

```metorex
Rex::Core::Metadata::HashPopulator.class_exec do
  alias_method :rex_build_description_from, :build_description_from

  def build_description_from(parent_description = nil, my_description = nil)
    rex_build_description_from(parent_description, my_description).upcase
  end
end

RSpec.describe "an invoice" do
  it "is described by the redefined step" do |example|
    expect(example.metadata[:description]).to eq("IS DESCRIBED BY THE REDEFINED STEP")
  end
end
```
