---
title: "advanced/dsl_example.rb"
slug: advanced-dsl-example
description: "The metorex example program advanced/dsl_example.rb and its output."
---

`tests/_examples/advanced/dsl_example.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/dsl_example.rb).

```metorex
class Calculator
  def self.add(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end
end

describe "Calculator" do
  it "adds numbers" do
    expect(Calculator.add(2, 3)).to_equal(5)
  end

  it "multiplies numbers" do
    expect(Calculator.multiply(4, 5)).to_equal(20)
  end
end
```
