---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/platform.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-platform
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/platform.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/platform.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/platform.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Platform
    attr_reader :options
    def initialize(options)
      @options = options
    end

    def run
      ruby_version = if Bundler.locked_gems
        Bundler.locked_gems.ruby_version&.gsub(/p\d+\Z/, "")
      else
        Bundler.definition.ruby_version&.single_version_string
      end

      output = []

      if options[:ruby]
        if ruby_version
          output << ruby_version
        else
          output << "No ruby version specified"
        end
      else
        platforms = Bundler.definition.platforms.map {|p| "* #{p}" }

        output << "Your platform is: #{Gem::Platform.local}"
        output << "Your app has gems that work on these platforms:\n#{platforms.join("\n")}"

        if ruby_version
          output << "Your Gemfile specifies a Ruby version requirement:\n* #{ruby_version}"

          begin
            Bundler.definition.validate_runtime!
            output << "Your current platform satisfies the Ruby version requirement."
          rescue RubyVersionMismatch => e
            output << e.message
          end
        else
          output << "Your Gemfile does not specify a Ruby version requirement."
        end
      end

      Bundler.ui.info output.join("\n\n")
    end
  end
end
```
