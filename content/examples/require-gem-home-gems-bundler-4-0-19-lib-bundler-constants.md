---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/constants.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-constants
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/constants.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/constants.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/constants.rb).

```metorex
# frozen_string_literal: true

require "rbconfig"

module Bundler
  WINDOWS = RbConfig::CONFIG["host_os"] =~ /(msdos|mswin|djgpp|mingw)/
  deprecate_constant :WINDOWS

  FREEBSD = RbConfig::CONFIG["host_os"].to_s.include?("bsd")
  deprecate_constant :FREEBSD

  NULL = File::NULL
  deprecate_constant :NULL
end
```
