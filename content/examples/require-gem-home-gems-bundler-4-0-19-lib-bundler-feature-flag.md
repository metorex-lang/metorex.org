---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/feature_flag.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-feature-flag
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/feature_flag.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/feature_flag.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/feature_flag.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class FeatureFlag
    (1..10).each {|v| define_method("bundler_#{v}_mode?") { @major_version >= v } }

    def removed_major?(target_major_version)
      @major_version > target_major_version
    end

    def deprecated_major?(target_major_version)
      @major_version >= target_major_version
    end

    def initialize(bundler_version)
      @bundler_version = Gem::Version.create(bundler_version)
      @major_version = @bundler_version.segments.first
    end
  end
end
```
