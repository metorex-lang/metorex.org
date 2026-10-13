---
title: "oop/autoload_replaced_by_assignment.rb"
slug: oop-autoload-replaced-by-assignment
description: "The metorex example program oop/autoload_replaced_by_assignment.rb and its output."
---

`tests/_examples/oop/autoload_replaced_by_assignment.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_replaced_by_assignment.rb).

```metorex
autoload :Ledger, "ledger_never_loaded"
Ledger = 5
p Object.autoload?(:Ledger), Ledger
module Books
  autoload :Entry, "entry_never_loaded"
  Entry = 3
end
p Books.autoload?(:Entry), Books::Entry
autoload :Receipt, "receipt_never_loaded"
Object.const_set(:Receipt, 7)
p Object.autoload?(:Receipt)
```

Output:

```
nil
5
nil
3
nil
```
