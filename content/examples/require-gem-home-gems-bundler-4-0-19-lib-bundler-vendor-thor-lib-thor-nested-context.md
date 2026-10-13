---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/nested_context.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-thor-lib-thor-nested-context
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/nested_context.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/nested_context.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/nested_context.rb).

```metorex
class Bundler::Thor
  class NestedContext
    def initialize
      @depth = 0
    end

    def enter
      push

      yield
    ensure
      pop
    end

    def entered?
      @depth.positive?
    end

  private

    def push
      @depth += 1
    end

    def pop
      @depth -= 1
    end
  end
end
```
