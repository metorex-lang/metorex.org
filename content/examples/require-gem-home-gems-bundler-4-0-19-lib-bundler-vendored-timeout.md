---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_timeout.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendored-timeout
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_timeout.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_timeout.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_timeout.rb).

```metorex
# frozen_string_literal: true

begin
  require "rubygems/vendored_timeout"
rescue LoadError
  begin
    require "rubygems/timeout"
  rescue LoadError
    require "timeout"
    Gem::Timeout = Timeout
  end
end
```
