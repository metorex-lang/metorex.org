---
title: "rex/mocks/should_syntax/spec/spec_helper.rb"
slug: rex-mocks-should-syntax-spec-spec-helper
description: "The metorex example program rex/mocks/should_syntax/spec/spec_helper.rb and its output."
---

`tests/_examples/rex/mocks/should_syntax/spec/spec_helper.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/mocks/should_syntax/spec/spec_helper.rb){target=_blank rel=noopener}.

```metorex
RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.syntax = [:should, :expect]
  end
end
```
