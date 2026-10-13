---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/init.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-init
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/init.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/init.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/init.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Init
    attr_reader :options
    def initialize(options)
      @options = options
    end

    def run
      if File.exist?(gemfile)
        Bundler.ui.error "#{gemfile} already exists at #{File.expand_path(gemfile)}"
        exit 1
      end

      unless File.writable?(Dir.pwd)
        Bundler.ui.error "Can not create #{gemfile} as the current directory is not writable."
        exit 1
      end

      if options[:gemspec]
        gemspec = File.expand_path(options[:gemspec])
        unless File.exist?(gemspec)
          Bundler.ui.error "Gem specification #{gemspec} doesn't exist"
          exit 1
        end

        spec = Bundler.load_gemspec_uncached(gemspec)

        File.open(gemfile, "wb") do |file|
          file << "# Generated from #{gemspec}\n"
          file << spec.to_gemfile
        end
      else
        File.open(File.expand_path("../templates/Gemfile", __dir__), "r") do |template|
          File.open(gemfile, "wb") do |destination|
            IO.copy_stream(template, destination)
          end
        end
      end

      puts "Writing new #{gemfile} to #{SharedHelpers.pwd}/#{gemfile}"
    end

    private

    def gemfile
      @gemfile ||= options[:gemfile] || Bundler.preferred_gemfile_name
    end
  end
end
```
