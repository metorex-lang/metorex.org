---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/rg_proxy.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-ui-rg-proxy
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/rg_proxy.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/rg_proxy.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/rg_proxy.rb).

```metorex
# frozen_string_literal: true

require_relative "../ui"
require "rubygems/user_interaction"

module Bundler
  module UI
    class RGProxy < ::Gem::SilentUI
      def initialize(ui)
        @ui = ui
        super()
      end

      def say(message)
        @ui&.debug(message)
      end
    end
  end
end
```
