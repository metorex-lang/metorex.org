---
title: "rex/mocks/any_instance_features/spec/any_instance_features_spec.rb"
slug: rex-mocks-any-instance-features-spec-any-instance-features-spec
description: "The metorex example program rex/mocks/any_instance_features/spec/any_instance_features_spec.rb and its output."
---

`tests/_examples/rex/mocks/any_instance_features/spec/any_instance_features_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/mocks/any_instance_features/spec/any_instance_features_spec.rb){target=_blank rel=noopener}.

```metorex
class Invoice
  def initialize(number)
    @number = number
  end

  attr_reader :number

  def total
    100
  end
end

describe "any instance features" do
  it "hands the receiving instance to the implementation block" do
    allow_any_instance_of(Invoice).to receive(:total) { |invoice| invoice.number * 10 }
    expect(Invoice.new(3).total).to eq(30)
  end

  it "stubs a message chain on any instance" do
    allow_any_instance_of(Invoice).to receive_message_chain(:customer, :name).and_return("Acme")
    expect(Invoice.new(1).customer.name).to eq("Acme")
  end

  it "fulfills an expectation with the instance that received it" do
    expect_any_instance_of(Invoice).to receive(:total).and_return(5)
    expect(Invoice.new(1).total).to eq(5)
  end

  it "restores the method after the example" do
    expect(Invoice.new(1).total).to eq(100)
  end
end
```
