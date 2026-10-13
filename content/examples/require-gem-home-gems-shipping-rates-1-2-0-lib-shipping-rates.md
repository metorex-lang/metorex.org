---
title: "require/gem_home/gems/shipping_rates-1.2.0/lib/shipping_rates.rb"
slug: require-gem-home-gems-shipping-rates-1-2-0-lib-shipping-rates
description: "The metorex example program require/gem_home/gems/shipping_rates-1.2.0/lib/shipping_rates.rb and its output."
---

`tests/_examples/require/gem_home/gems/shipping_rates-1.2.0/lib/shipping_rates.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/shipping_rates-1.2.0/lib/shipping_rates.rb){target=_blank rel=noopener}.

```metorex
require "tariff_table"
require "shipping_rates/zones"

module ShippingRates
  VERSION = "1.2.0"

  def self.for(kilograms) = kilograms * TariffTable::BASE
end
```
