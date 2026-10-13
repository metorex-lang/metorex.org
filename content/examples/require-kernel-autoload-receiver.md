---
title: "require/kernel_autoload_receiver.rb"
slug: require-kernel-autoload-receiver
description: "The metorex example program require/kernel_autoload_receiver.rb and its output."
---

`tests/_examples/require/kernel_autoload_receiver.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/kernel_autoload_receiver.rb){target=_blank rel=noopener}.

```metorex
# `Kernel.autoload` sent to Kernel itself registers where the call sits, which
# at the top level is Object, and `Kernel.autoload?` reads it back from there.
target = File.expand_path("autoload_lib/ledger_rate.rb", __dir__)
Kernel.autoload(:LedgerRateLater, target)
p Object.const_defined?(:LedgerRateLater, false)
p Kernel.autoload?(:LedgerRateLater) == target
p Kernel.const_defined?(:LedgerRateLater, false)
```

Output:

```
true
true
false
```
