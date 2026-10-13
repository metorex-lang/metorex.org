---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/path.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-plugin-installer-path
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/path.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/path.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/path.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  module Plugin
    class Installer
      class Path < Bundler::Source::Path
        def root
          SharedHelpers.in_bundle? ? Bundler.root : Plugin.root
        end

        def eql?(other)
          return unless other.class == self.class
          expanded_original_path == other.expanded_original_path &&
            version == other.version
        end

        alias_method :==, :eql?

        def generate_bin(spec, disable_extensions = false)
          # Need to find a way without code duplication
          # For now, we can ignore this
        end
      end
    end
  end
end
```
