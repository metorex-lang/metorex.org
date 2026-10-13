---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/ui.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-ui
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/ui.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/ui.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/ui.rb).

```metorex
# frozen_string_literal: true

module Bundler
  module UI
    autoload :RGProxy, File.expand_path("ui/rg_proxy", __dir__)
    autoload :Shell,   File.expand_path("ui/shell", __dir__)
    autoload :Silent,  File.expand_path("ui/silent", __dir__)
  end
end
```
