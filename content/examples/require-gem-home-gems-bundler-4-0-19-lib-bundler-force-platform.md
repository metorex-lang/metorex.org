---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/force_platform.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-force-platform
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/force_platform.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/force_platform.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/force_platform.rb).

```metorex
# frozen_string_literal: true

module Bundler
  module ForcePlatform
    # The `:force_ruby_platform` value used by dependencies for resolution, and
    # by locked specifications for materialization is `false` by default, except
    # for TruffleRuby. TruffleRuby generally needs to force the RUBY platform
    # variant unless the name is explicitly allowlisted.

    def default_force_ruby_platform
      return false unless RUBY_ENGINE == "truffleruby"

      !Gem::Platform::REUSE_AS_BINARY_ON_TRUFFLERUBY.include?(name)
    end
  end
end
```
