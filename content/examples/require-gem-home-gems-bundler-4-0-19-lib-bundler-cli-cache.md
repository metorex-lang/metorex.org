---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/cache.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-cache
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/cache.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/cache.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/cache.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Cache
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      Bundler.ui.level = "warn" if options[:quiet]
      Bundler.settings.set_command_option_if_given :cache_path, options["cache-path"]

      install

      Bundler.settings.temporary(cache_all_platforms: options["all-platforms"]) do
        Bundler.load.cache
      end
    end

    private

    def install
      require_relative "install"
      options = self.options.dup
      options["local"] = false if Bundler.settings[:cache_all_platforms]
      options["no-cache"] = true
      Bundler::CLI::Install.new(options).run
    end
  end
end
```
