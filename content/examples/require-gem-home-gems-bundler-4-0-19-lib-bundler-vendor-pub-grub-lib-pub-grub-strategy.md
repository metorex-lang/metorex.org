---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-pub-grub-lib-pub-grub-strategy
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/strategy.rb).

```metorex
module Bundler::PubGrub
  class Strategy
    def initialize(source)
      @source = source

      @root_package = Package.root
      @root_version = Package.root_version

      @version_indexes = Hash.new do |h,k|
        if k == @root_package
          h[k] = { @root_version => 0 }
        else
          h[k] = @source.all_versions_for(k).each.with_index.to_h
        end
      end
    end

    def next_package_and_version(unsatisfied)
      package, range = next_term_to_try_from(unsatisfied)

      [package, most_preferred_version_of(package, range)]
    end

    private

    def most_preferred_version_of(package, range)
      versions = @source.versions_for(package, range)

      indexes = @version_indexes[package]
      versions.min_by { |version| indexes[version] }
    end

    def next_term_to_try_from(unsatisfied)
      unsatisfied.min_by do |package, range|
        matching_versions = @source.versions_for(package, range)
        higher_versions = @source.versions_for(package, range.upper_invert)

        [matching_versions.count <= 1 ? 0 : 1, higher_versions.count]
      end
    end
  end
end
```
