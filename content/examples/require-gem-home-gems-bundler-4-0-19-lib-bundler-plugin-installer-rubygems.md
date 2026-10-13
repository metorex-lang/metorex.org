---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/rubygems.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-plugin-installer-rubygems
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/rubygems.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/rubygems.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/plugin/installer/rubygems.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  module Plugin
    class Installer
      class Rubygems < Bundler::Source::Rubygems
        private

        def rubygems_dir
          Plugin.root
        end

        def cache_path
          Plugin.cache
        end
      end
    end
  end
end
```
