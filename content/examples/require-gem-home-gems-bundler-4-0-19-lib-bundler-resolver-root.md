---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/root.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-resolver-root
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/root.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/root.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/root.rb).

```metorex
# frozen_string_literal: true

require_relative "package"

module Bundler
  class Resolver
    #
    # Represents the Gemfile from the resolver's perspective. It's the root
    # package and Gemfile entries depend on it.
    #
    class Root < Package
      def initialize(name)
        @name = name
      end

      def meta?
        true
      end

      def root?
        true
      end
    end
  end
end
```
