---
title: "rex/expectations/syntax/spec/spec_helper.rb"
slug: rex-expectations-syntax-spec-spec-helper
description: "The metorex example program rex/expectations/syntax/spec/spec_helper.rb and its output."
---

`tests/_examples/rex/expectations/syntax/spec/spec_helper.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/expectations/syntax/spec/spec_helper.rb){target=_blank rel=noopener}.

```metorex
RSpec.configure do |config|
  config.expect_with(:rspec) do |expectations|
    expectations.syntax = [:should, :expect]
  end
end
```
