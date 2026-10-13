---
title: "require/bundler_setup_no_parens.rb"
slug: require-bundler-setup-no-parens
description: "The metorex example program require/bundler_setup_no_parens.rb and its output."
---

`tests/_examples/require/bundler_setup_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/bundler_setup_no_parens.rb).

```metorex
# `require "bundler/setup"` reads the Gemfile and Gemfile.lock that
# BUNDLE_GEMFILE names and puts the locked version of each gem on the load
# path, though a newer one is installed.
ENV["BUNDLE_GEMFILE"] = File.join __dir__, "bundled_app", "Gemfile"
require "bundler/setup"
require "shipping_rates"

p ShippingRates::VERSION
p Bundler.load.specs.map(&:full_name).sort
p $LOAD_PATH.grep(/shipping_rates/).map { |path| path.split("/").last(2).join "/" }
begin
  gem "shipping_rates", "1.2.0"
rescue Gem::LoadError => error
  puts error.message
end
```
