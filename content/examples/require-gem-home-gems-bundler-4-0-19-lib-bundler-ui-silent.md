---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/silent.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-ui-silent
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/silent.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/silent.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/ui/silent.rb).

```metorex
# frozen_string_literal: true

module Bundler
  module UI
    class Silent
      attr_writer :shell

      def initialize
        @warnings = []
      end

      def add_color(string, color)
        string
      end

      def info(message = nil, newline = nil)
      end

      def confirm(message = nil, newline = nil)
      end

      def warn(message = nil, newline = nil)
        @warnings |= [message]
      end

      def error(message = nil, newline = nil)
      end

      def debug(message = nil, newline = nil)
      end

      def confirm?
        false
      end

      def error?
        false
      end

      def debug?
        false
      end

      def info?
        false
      end

      def quiet?
        false
      end

      def warn?
        false
      end

      def output_stream=(_symbol)
      end

      def output_stream
        nil
      end

      def ask(message)
      end

      def yes?(msg)
        raise "Cannot ask yes? with a silent shell"
      end

      def no?(msg)
        raise "Cannot ask no? with a silent shell"
      end

      def level=(name)
      end

      def level(name = nil)
      end

      def trace(message, newline = nil, force = false)
      end

      def silence
        yield
      end

      def progress
        yield
      end

      def unprinted_warnings
        @warnings
      end
    end
  end
end
```
