---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-pub-grub-lib-pub-grub
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub.rb).

```metorex
require_relative "pub_grub/package"
require_relative "pub_grub/static_package_source"
require_relative "pub_grub/term"
require_relative "pub_grub/version_range"
require_relative "pub_grub/version_constraint"
require_relative "pub_grub/version_union"
require_relative "pub_grub/version_solver"
require_relative "pub_grub/incompatibility"
require_relative 'pub_grub/solve_failure'
require_relative 'pub_grub/failure_writer'
require_relative 'pub_grub/version'

module Bundler::PubGrub
  class << self
    attr_writer :logger

    def logger
      @logger || default_logger
    end

    private

    def default_logger
      require "logger"

      logger = ::Logger.new(STDERR)
      logger.level = $DEBUG ? ::Logger::DEBUG : ::Logger::WARN
      @logger = logger
    end
  end
end
```
