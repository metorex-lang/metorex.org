---
title: "oop/autoload_reopening.rb"
slug: oop-autoload-reopening
description: "The metorex example program oop/autoload_reopening.rb and its output."
---

`tests/_examples/oop/autoload_reopening.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_reopening.rb).

```metorex
$LOAD_PATH.unshift(File.join(__dir__, "autoload_fixture"))
autoload(:Ledger, "ledger")
autoload(:Auditing, "auditing")
autoload(:Invoice, "invoice")

p(defined?(Ledger))
p(defined?(::Invoice))

class Ledger
  def balance = total - 25
end
p(Ledger.new.balance)

module Auditing
  def self.enabled? = level == :full
end
p(Auditing.enabled?)

p(::Invoice.new.number)
```

Output:

```
"constant"
"constant"
75
true
1042
```
