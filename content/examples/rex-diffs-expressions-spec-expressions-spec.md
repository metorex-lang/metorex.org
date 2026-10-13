---
title: "rex/diffs/expressions/spec/expressions_spec.rb"
slug: rex-diffs-expressions-spec-expressions-spec
description: "The metorex example program rex/diffs/expressions/spec/expressions_spec.rb and its output."
---

`tests/_examples/rex/diffs/expressions/spec/expressions_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/diffs/expressions/spec/expressions_spec.rb).

```metorex
User = Struct.new(:name, :age)

describe "failing expressions" do
  let(:user) { User.new("Ada", 41) }

  it "names a one-line expression" do
    expect(user.age).to eq(42)
  end

  it "prints every line of a multi-line expression" do
    expect(user.name).to eq(
      "Grace"
    )
  end

  it "prints a multi-line block expectation" do
    expect {
      user.age += 1
    }.to change { user.age }.by(2)
  end

  it "names a negated expectation" do
    expect(user.name).not_to start_with("A")
  end

  it "leaves a literal as it is" do
    expect(41).to eq(42)
  end

  it "keeps a message the expectation was given" do
    expect(user.age).to eq(42), "the age is off"
  end
end
```
