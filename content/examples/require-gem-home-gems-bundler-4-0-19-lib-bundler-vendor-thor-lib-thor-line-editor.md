---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-thor-lib-thor-line-editor
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/thor/lib/thor/line_editor.rb).

```metorex
require_relative "line_editor/basic"
require_relative "line_editor/readline"

class Bundler::Thor
  module LineEditor
    def self.readline(prompt, options = {})
      best_available.new(prompt, options).readline
    end

    def self.best_available
      [
        Bundler::Thor::LineEditor::Readline,
        Bundler::Thor::LineEditor::Basic
      ].detect(&:available?)
    end
  end
end
```
