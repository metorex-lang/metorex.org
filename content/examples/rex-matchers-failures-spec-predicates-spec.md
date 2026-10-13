---
title: "rex/matchers/failures/spec/predicates_spec.rb"
slug: rex-matchers-failures-spec-predicates-spec
description: "The metorex example program rex/matchers/failures/spec/predicates_spec.rb and its output."
---

`tests/_examples/rex/matchers/failures/spec/predicates_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/matchers/failures/spec/predicates_spec.rb){target=_blank rel=noopener}.

```metorex
Shipment = Struct.new(:items) do
  def delivered? = false
  def has_items? = !items.empty?
  def overdue?(days) = days > 10
end

describe "predicate matchers" do
  it("be_empty") { expect([1]).to be_empty }
  it("be_empty negated") { expect([]).not_to be_empty }
  it("be_delivered") { expect(Shipment.new([])).to be_delivered }
  it("have_items") { expect(Shipment.new([])).to have_items }
  it("be_overdue with an argument") { expect(Shipment.new([])).to be_overdue(5) }
  it("be_a predicate it lacks") { expect(Shipment.new([])).to be_frozen_solid }
  it("have_key") { expect({ a: 1 }).to have_key(:b) }
end
```
