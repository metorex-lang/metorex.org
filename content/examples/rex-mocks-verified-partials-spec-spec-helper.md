---
title: "rex/mocks/verified_partials/spec/spec_helper.rb"
slug: rex-mocks-verified-partials-spec-spec-helper
description: "The metorex example program rex/mocks/verified_partials/spec/spec_helper.rb and its output."
---

`tests/_examples/rex/mocks/verified_partials/spec/spec_helper.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/mocks/verified_partials/spec/spec_helper.rb).

```metorex
RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
```
