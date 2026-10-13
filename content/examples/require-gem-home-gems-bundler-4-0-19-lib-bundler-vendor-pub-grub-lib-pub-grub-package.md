---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/package.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-pub-grub-lib-pub-grub-package
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/package.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/package.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/package.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler::PubGrub
  class Package

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def inspect
      "#<#{self.class} #{name.inspect}>"
    end

    def <=>(other)
      name <=> other.name
    end

    ROOT = Package.new(:root)
    ROOT_VERSION = 0

    def self.root
      ROOT
    end

    def self.root_version
      ROOT_VERSION
    end

    def self.root?(package)
      if package.respond_to?(:root?)
        package.root?
      else
        package == root
      end
    end

    def to_s
      name.to_s
    end
  end
end
```
