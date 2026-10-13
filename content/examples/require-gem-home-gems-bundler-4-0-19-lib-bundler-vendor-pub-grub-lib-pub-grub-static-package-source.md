---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/static_package_source.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-pub-grub-lib-pub-grub-static-package-source
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/static_package_source.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/static_package_source.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/static_package_source.rb){target=_blank rel=noopener}.

```metorex
require_relative 'package'
require_relative 'rubygems'
require_relative 'version_constraint'
require_relative 'incompatibility'
require_relative 'basic_package_source'

module Bundler::PubGrub
  class StaticPackageSource < BasicPackageSource
    class DSL
      def initialize(packages, root_deps)
        @packages = packages
        @root_deps = root_deps
      end

      def root(deps:)
        @root_deps.update(deps)
      end

      def add(name, version, deps: {})
        version = Gem::Version.new(version)
        @packages[name] ||= {}
        raise ArgumentError, "#{name} #{version} declared twice" if @packages[name].key?(version)
        @packages[name][version] = clean_deps(name, version, deps)
      end

      private

      # Exclude redundant self-referencing dependencies
      def clean_deps(name, version, deps)
        deps.reject {|dep_name, req| name == dep_name && Bundler::PubGrub::RubyGems.parse_range(req).include?(version) }
      end
    end

    def initialize
      @root_deps = {}
      @packages = {}

      yield DSL.new(@packages, @root_deps)

      super()
    end

    def all_versions_for(package)
      @packages[package].keys
    end

    def root_dependencies
      @root_deps
    end

    def dependencies_for(package, version)
      @packages[package][version]
    end

    def parse_dependency(package, dependency)
      return false unless @packages.key?(package)

      Bundler::PubGrub::RubyGems.parse_constraint(package, dependency)
    end
  end
end
```
