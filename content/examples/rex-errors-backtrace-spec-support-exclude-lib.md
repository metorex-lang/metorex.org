---
title: "rex/errors/backtrace/spec/support/exclude_lib.rb"
slug: rex-errors-backtrace-spec-support-exclude-lib
description: "The metorex example program rex/errors/backtrace/spec/support/exclude_lib.rb and its output."
---

`tests/_examples/rex/errors/backtrace/spec/support/exclude_lib.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/backtrace/spec/support/exclude_lib.rb).

```metorex
RSpec.configure { |config| config.backtrace_exclusion_patterns << %r{/lib/inventory} }
```
