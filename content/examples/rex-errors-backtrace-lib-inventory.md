---
title: "rex/errors/backtrace/lib/inventory.rb"
slug: rex-errors-backtrace-lib-inventory
description: "The metorex example program rex/errors/backtrace/lib/inventory.rb and its output."
---

`tests/_examples/rex/errors/backtrace/lib/inventory.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/backtrace/lib/inventory.rb){target=_blank rel=noopener}.

```metorex
require_relative "../vendor/gems/fake_client-1.2/lib/fake_client"

module Inventory
  def self.count
    FakeClient.fetch("/items")
  end
end
```
