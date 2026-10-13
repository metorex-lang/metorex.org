---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/shell/column_printer.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-thor-lib-thor-shell-column-printer
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/shell/column_printer.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/shell/column_printer.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/shell/column_printer.rb){target=_blank rel=noopener}.

```metorex
require_relative "terminal"

class Bundler::Thor
  module Shell
    class ColumnPrinter
      attr_reader :stdout, :options

      def initialize(stdout, options = {})
        @stdout = stdout
        @options = options
        @indent = options[:indent].to_i
      end

      def print(array)
        return if array.empty?
        colwidth = (array.map { |el| el.to_s.size }.max || 0) + 2
        array.each_with_index do |value, index|
          # Don't output trailing spaces when printing the last column
          if ((((index + 1) % (Terminal.terminal_width / colwidth))).zero? && !index.zero?) || index + 1 == array.length
            stdout.puts value
          else
            stdout.printf("%-#{colwidth}s", value)
          end
        end
      end
    end
  end
end

```
