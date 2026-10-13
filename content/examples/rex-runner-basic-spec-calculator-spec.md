---
title: "rex/runner/basic/spec/calculator_spec.rb"
slug: rex-runner-basic-spec-calculator-spec
description: "The metorex example program rex/runner/basic/spec/calculator_spec.rb and its output."
---

`tests/_examples/rex/runner/basic/spec/calculator_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/runner/basic/spec/calculator_spec.rb){target=_blank rel=noopener}.

```metorex
class Calculator
  def add(a, b) = a + b
  def divide(a, b) = a / b
end

describe Calculator do
  let(:calculator) { Calculator.new }

  it "adds two numbers" do
    expect(calculator.add(2, 3)).to eq(5)
  end

  it "reports a wrong sum" do
    expect(calculator.add(2, 2)).to eq(5)
  end

  context "when dividing" do
    it "divides evenly" do
      expect(calculator.divide(10, 2)).to eq(5)
    end

    it "raises on zero" do
      calculator.divide(1, 0)
    end

    it "is not written yet"

    xit "is turned off" do
      expect(1).to eq(1)
    end
  end
end
```
