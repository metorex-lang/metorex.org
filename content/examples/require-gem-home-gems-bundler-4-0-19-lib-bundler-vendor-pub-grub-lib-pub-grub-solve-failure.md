---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/solve_failure.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-pub-grub-lib-pub-grub-solve-failure
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/solve_failure.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/solve_failure.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/solve_failure.rb).

```metorex
require_relative 'failure_writer'

module Bundler::PubGrub
  class SolveFailure < StandardError
    attr_reader :incompatibility

    def initialize(incompatibility)
      @incompatibility = incompatibility
    end

    def to_s
      "Could not find compatible versions\n\n#{explanation}"
    end

    def explanation
      @explanation ||= FailureWriter.new(@incompatibility).write
    end
  end
end
```
