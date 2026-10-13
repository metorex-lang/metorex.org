---
title: "rex/errors/backtrace/spec/support/include_vendor.rb"
slug: rex-errors-backtrace-spec-support-include-vendor
description: "The metorex example program rex/errors/backtrace/spec/support/include_vendor.rb and its output."
---

`tests/_examples/rex/errors/backtrace/spec/support/include_vendor.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/backtrace/spec/support/include_vendor.rb){target=_blank rel=noopener}.

```metorex
RSpec.configure do |config|
  config.backtrace_exclusion_patterns << %r{/vendor/}
  config.backtrace_inclusion_patterns << /fake_client/
end
```
