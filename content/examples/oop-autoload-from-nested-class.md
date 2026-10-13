---
title: "oop/autoload_from_nested_class.rb"
slug: oop-autoload-from-nested-class
description: "The metorex example program oop/autoload_from_nested_class.rb and its output."
---

`tests/_examples/oop/autoload_from_nested_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_from_nested_class.rb).

```metorex
$LOAD_PATH.unshift(File.join(__dir__, "autoload_fixture"))

module Shipping
  autoload :Rates, "shipping_rates"

  class Quote
    def total = Rates.flat + 3
  end
end

class Order
end

Order.module_exec do
  p(Shipping::Quote.new.total)
end
```

Output:

```
15
```
