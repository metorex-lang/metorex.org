---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/clean.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-clean
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/clean.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/clean.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/clean.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Clean
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      require_path_or_force unless options[:"dry-run"]
      Bundler.load.clean(options[:"dry-run"])
    end

    protected

    def require_path_or_force
      return unless Bundler.use_system_gems? && !options[:force]
      raise InvalidOption, "Cleaning all the gems on your system is dangerous! " \
        "If you're sure you want to remove every system gem not in this " \
        "bundle, run `bundle clean --force`."
    end
  end
end
```
