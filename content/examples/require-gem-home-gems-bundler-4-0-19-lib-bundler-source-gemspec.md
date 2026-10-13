---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/source/gemspec.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-source-gemspec
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/source/gemspec.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/source/gemspec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/source/gemspec.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  class Source
    class Gemspec < Path
      attr_reader :gemspec
      attr_writer :checksum_store

      def initialize(options)
        super
        @gemspec = options["gemspec"]
      end

      def to_s
        "gemspec at `#{@path}`"
      end
    end
  end
end
```
