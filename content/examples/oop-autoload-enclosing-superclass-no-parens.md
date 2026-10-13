---
title: "oop/autoload_enclosing_superclass_no_parens.rb"
slug: oop-autoload-enclosing-superclass-no-parens
description: "The metorex example program oop/autoload_enclosing_superclass_no_parens.rb and its output."
---

`tests/_examples/oop/autoload_enclosing_superclass_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_enclosing_superclass_no_parens.rb).

```metorex
$LOAD_PATH.unshift File.join(__dir__, "autoload_fixture")

module Shipping
  autoload :Carrier, "shipping_carrier"

  module Ground
    class Truck < Carrier
      def name = "truck after #{super}"
    end
  end
end

p Shipping::Ground::Truck.new.name
p Shipping::Ground::Truck.superclass
```

Output:

```
"truck after carrier"
Shipping::Carrier
```
