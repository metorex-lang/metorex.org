---
title: "rex/errors/interrupt/spec/interrupt_spec.rb"
slug: rex-errors-interrupt-spec-interrupt-spec
description: "The metorex example program rex/errors/interrupt/spec/interrupt_spec.rb and its output."
---

`tests/_examples/rex/errors/interrupt/spec/interrupt_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/interrupt/spec/interrupt_spec.rb){target=_blank rel=noopener}.

```metorex
describe "an interrupted run" do
  it "runs the first example" do
    expect(1).to eq(1)
  end

  it "is interrupted while it runs" do
    Process.kill("INT", Process.pid)
    sleep 0.2
    expect(2).to eq(2)
  end

  it "never runs the third example" do
    raise "this example should not run"
  end
end

describe "a later group" do
  it "never runs" do
    raise "this group should not run"
  end
end
```
