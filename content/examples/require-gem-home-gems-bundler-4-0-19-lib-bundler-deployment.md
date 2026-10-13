---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/deployment.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-deployment
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/deployment.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/deployment.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/deployment.rb).

```metorex
# frozen_string_literal: true

require_relative "shared_helpers"
Bundler::SharedHelpers.feature_removed! "Bundler no longer integrates with " \
  "Capistrano, but Capistrano provides its own integration with " \
  "Bundler via the capistrano-bundler gem. Use it instead."
```
