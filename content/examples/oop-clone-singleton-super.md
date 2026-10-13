---
title: "oop/clone_singleton_super.rb"
slug: oop-clone-singleton-super
description: "The metorex example program oop/clone_singleton_super.rb and its output."
---

`tests/_examples/oop/clone_singleton_super.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/clone_singleton_super.rb).

```metorex
module Counting
  def total(values) = values.sum
end

ledger = Object.new
ledger.singleton_class.include(Counting)
ledger.singleton_class.define_method(:total) { |values| super(values) + 1 }
copy = ledger.clone
p copy.total([1, 2])
p copy.method(:total).owner == copy.singleton_class

module Reporting
  def heading = "report"
end
copied_module = Reporting.dup
p copied_module.instance_method(:heading).owner == copied_module
```

Output:

```
4
true
true
```
