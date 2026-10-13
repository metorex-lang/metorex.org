---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_thor.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendored-thor
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_thor.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_thor.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_thor.rb).

```metorex
# frozen_string_literal: true

module Bundler
  def self.require_thor_actions
    require_relative "vendor/thor/lib/thor/actions"
  end
end
require_relative "vendor/thor/lib/thor"
```
