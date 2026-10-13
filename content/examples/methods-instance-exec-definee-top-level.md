---
title: "methods/instance_exec_definee/top_level.rb"
slug: methods-instance-exec-definee-top-level
description: "The metorex example program methods/instance_exec_definee/top_level.rb and its output."
---

`tests/_examples/methods/instance_exec_definee/top_level.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/instance_exec_definee/top_level.rb){target=_blank rel=noopener}.

```metorex
class Ledger
end

ledger = Ledger.new
ledger.instance_exec { eval %{def balance = 10} }
p ledger.singleton_methods
p Object.private_method_defined?(:balance)

ledger.instance_exec { load File.join(__dir__, "loaded_helper.rb") }
p ledger.singleton_methods
p Object.private_method_defined?(:loaded_helper)
```

Output:

```
[:balance]
false
[:balance]
true
```
