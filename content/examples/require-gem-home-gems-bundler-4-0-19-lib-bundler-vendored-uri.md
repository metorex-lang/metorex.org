---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_uri.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendored-uri
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_uri.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_uri.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_uri.rb).

```metorex
# frozen_string_literal: true

module Bundler; end

# Use RubyGems vendored copy when available. Otherwise fallback to Bundler
# vendored copy. The vendored copy in Bundler can be removed once support for
# RubyGems 3.5 is dropped.

begin
  require "rubygems/vendor/uri/lib/uri"
rescue LoadError
  require_relative "vendor/uri/lib/uri"
  Gem::URI = Bundler::URI

  module Gem
    def URI(uri) # rubocop:disable Naming/MethodName
      Bundler::URI(uri)
    end
    module_function :URI
  end
end
```
