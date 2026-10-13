---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/binstubs.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-binstubs
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/binstubs.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/binstubs.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/binstubs.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Binstubs
    attr_reader :options, :gems
    def initialize(options, gems)
      @options = options
      @gems = gems
    end

    def run
      Bundler.definition.validate_runtime!
      path_option = options["path"]
      path_option = nil if path_option&.empty?
      Bundler.settings.set_command_option :bin, path_option if options["path"]
      Bundler.settings.set_command_option_if_given :shebang, options["shebang"]
      installer = Installer.new(Bundler.root, Bundler.definition)

      installer_opts = {
        force: options[:force],
        binstubs_cmd: true,
        all_platforms: options["all-platforms"],
      }

      if options[:all]
        raise InvalidOption, "Cannot specify --all with specific gems" unless gems.empty?
        @gems = Bundler.definition.specs.map(&:name)
        installer_opts.delete(:binstubs_cmd)
      elsif gems.empty?
        Bundler.ui.error "`bundle binstubs` needs at least one gem to run."
        exit 1
      end

      gems.each do |gem_name|
        spec = Bundler.definition.specs.find {|s| s.name == gem_name }
        unless spec
          raise GemNotFound, Bundler::CLI::Common.gem_not_found_message(
            gem_name, Bundler.definition.specs
          )
        end

        if options[:standalone]
          if gem_name == "bundler"
            Bundler.ui.warn("Sorry, Bundler can only be run via RubyGems.") unless options[:all]
            next
          end

          Bundler.settings.temporary(path: Bundler.settings[:path] || Bundler.root) do
            installer.generate_standalone_bundler_executable_stubs(spec, installer_opts)
          end
        else
          installer.generate_bundler_executable_stubs(spec, installer_opts)
        end
      end
    end
  end
end
```
