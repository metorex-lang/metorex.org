---
title: "require/installed_gems_newest.rb"
slug: require-installed-gems-newest
description: "The metorex example program require/installed_gems_newest.rb and its output."
---

`tests/_examples/require/installed_gems_newest.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/installed_gems_newest.rb){target=_blank rel=noopener}.

```metorex
# With GEM_HOME naming a directory of installed gems, `require` finds a file
# no load path directory holds in the newest gem that has it, and activates
# that gem's dependencies first.
home = ENV.fetch("GEM_HOME")
p(Gem.dir == home)
p(Gem.path.last == home)
p(Gem::Specification.find_all_by_name("shipping_rates").map(&:full_name))

require "shipping_rates"
p(ShippingRates::VERSION)
p(ShippingRates.for(3))
p(ShippingRates::ZONES)
p(Gem.loaded_specs.keys.sort & %w[shipping_rates tariff_table])
p($LOAD_PATH.any? { |entry| entry.end_with?("tariff_table-2.0.0/lib") })
p(require("shipping_rates"))
```
