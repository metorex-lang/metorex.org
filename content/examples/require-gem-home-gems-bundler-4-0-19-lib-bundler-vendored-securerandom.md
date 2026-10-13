---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_securerandom.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendored-securerandom
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_securerandom.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_securerandom.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_securerandom.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

# Use RubyGems vendored copy when available. Otherwise fallback to Bundler
# vendored copy. The vendored copy in Bundler can be removed once support for
# RubyGems 3.5.18 is dropped.

begin
  require "rubygems/vendored_securerandom"
rescue LoadError
  require_relative "vendor/securerandom/lib/securerandom"
  Gem::SecureRandom = Bundler::SecureRandom
end
```
