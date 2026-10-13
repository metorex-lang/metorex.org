---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor/basic.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-thor-lib-thor-line-editor-basic
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor/basic.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor/basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor/basic.rb){target=_blank rel=noopener}.

```metorex
class Bundler::Thor
  module LineEditor
    class Basic
      attr_reader :prompt, :options

      def self.available?
        true
      end

      def initialize(prompt, options)
        @prompt = prompt
        @options = options
      end

      def readline
        $stdout.print(prompt)
        get_input
      end

    private

      def get_input
        if echo?
          $stdin.gets
        else
          # Lazy-load io/console since it is gem-ified as of 2.3
          require "io/console"
          $stdin.noecho(&:gets)
        end
      end

      def echo?
        options.fetch(:echo, true)
      end
    end
  end
end
```
