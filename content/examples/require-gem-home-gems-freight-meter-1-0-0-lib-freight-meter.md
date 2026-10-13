---
title: "require/gem_home/gems/freight_meter-1.0.0/lib/freight_meter.rb"
slug: require-gem-home-gems-freight-meter-1-0-0-lib-freight-meter
description: "The metorex example program require/gem_home/gems/freight_meter-1.0.0/lib/freight_meter.rb and its output."
---

`tests/_examples/require/gem_home/gems/freight_meter-1.0.0/lib/freight_meter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/freight_meter-1.0.0/lib/freight_meter.rb){target=_blank rel=noopener}.

```metorex
require "freight_meter/meter"
require "tariff_table"

module FreightMeter
  def self.with_base(weights)
    charges(weights, TariffTable::BASE)
  end
end
```
