---
title: "rex/hooks/undefined_let/spec/undefined_let_spec.rb"
slug: rex-hooks-undefined-let-spec-undefined-let-spec
description: "The metorex example program rex/hooks/undefined_let/spec/undefined_let_spec.rb and its output."
---

`tests/_examples/rex/hooks/undefined_let/spec/undefined_let_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/hooks/undefined_let/spec/undefined_let_spec.rb){target=_blank rel=noopener}.

```metorex
describe "an account" do
  let(:account) { { balance: 100 } }
  let(:owner) { "Ada" }

  context "when nested" do
    let(:statement) { "monthly" }

    it "misspells a let" do
      expect(acount[:balance]).to eq(100)
    end
  end
end
```
