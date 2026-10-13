---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/remove.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-remove
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/remove.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/remove.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/cli/remove.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class CLI::Remove
    def initialize(gems, options)
      @gems = gems
      @options = options
    end

    def run
      raise InvalidOption, "Please specify gems to remove." if @gems.empty?

      Injector.remove(@gems, {})
      Installer.install(Bundler.root, Bundler.definition)
    end
  end
end
```
