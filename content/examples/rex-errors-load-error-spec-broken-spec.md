---
title: "rex/errors/load_error/spec/broken_spec.rb"
slug: rex-errors-load-error-spec-broken-spec
description: "The metorex example program rex/errors/load_error/spec/broken_spec.rb and its output."
---

`tests/_examples/rex/errors/load_error/spec/broken_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/load_error/spec/broken_spec.rb).

```metorex
describe "a file that fails to load" do
  it "never registers" do
    expect(1).to eq(1)
  end
end

UndefinedHelper.configure
```
