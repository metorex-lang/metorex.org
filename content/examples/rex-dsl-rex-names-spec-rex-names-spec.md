---
title: "rex/dsl/rex_names/spec/rex_names_spec.rb"
slug: rex-dsl-rex-names-spec-rex-names-spec
description: "The metorex example program rex/dsl/rex_names/spec/rex_names_spec.rb and its output."
---

`tests/_examples/rex/dsl/rex_names/spec/rex_names_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/dsl/rex_names/spec/rex_names_spec.rb){target=_blank rel=noopener}.

```metorex
Rex.describe "Rex names the framework" do
  it "is the module RSpec names" do
    expect(RSpec).to equal(Rex)
  end

  it "aliases the expectation failure class" do
    expect(Rex::Expectations::ExpectationNotMetError).to equal(Rex::ExpectationNotMet)
  end

  it "runs each example in an instance of its group" do
    expect(self).to be_a(Rex::Core::ExampleGroup)
  end
end

Rex.context "Rex.context" do
  it "defines a top-level group" do |example|
    expect(example.full_description).to eq("Rex.context defines a top-level group")
  end
end
```
