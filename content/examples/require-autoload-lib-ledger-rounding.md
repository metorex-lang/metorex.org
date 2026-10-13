---
title: "require/autoload_lib/ledger_rounding.rb"
slug: require-autoload-lib-ledger-rounding
description: "The metorex example program require/autoload_lib/ledger_rounding.rb and its output."
---

`tests/_examples/require/autoload_lib/ledger_rounding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/autoload_lib/ledger_rounding.rb).

```metorex
module Ledger
  module Rounding
    def rounded = (amount * 100).round / 100.0
  end
end
```
