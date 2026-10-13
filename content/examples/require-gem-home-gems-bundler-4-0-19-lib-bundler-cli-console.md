---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/console.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-console
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/console.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/console.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/console.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Console
    attr_reader :options, :group
    def initialize(options, group)
      @options = options
      @group = group
    end

    def run
      group ? Bundler.require(:default, *group.split(" ").map!(&:to_sym)) : Bundler.require
      ARGV.clear

      console = get_console(Bundler.settings[:console] || "irb")
      console.start
    end

    def get_console(name)
      require name
      get_constant(name)
    rescue LoadError
      if name == "irb"
        if defined?(Gem::BUNDLED_GEMS) && Gem::BUNDLED_GEMS.respond_to?(:force_activate)
          Gem::BUNDLED_GEMS.force_activate "irb"
          require name
          return get_constant(name)
        end
        Bundler.ui.error "#{name} is not available"
        exit 1
      else
        Bundler.ui.error "Couldn't load console #{name}, falling back to irb"
        name = "irb"
        retry
      end
    end

    def get_constant(name)
      const_name = {
        "pry" => :Pry,
        "ripl" => :Ripl,
        "irb" => :IRB,
      }[name]
      Object.const_get(const_name)
    end
  end
end
```
