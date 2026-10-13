---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_net_http.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendored-net-http
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_net_http.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_net_http.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendored_net_http.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

# This defined? guard can be removed once RubyGems 3.4 support is dropped.
#
# Bundler specs load this code from `spec/support/vendored_net_http.rb` to avoid
# activating the Bundler gem too early. Without this guard, we get redefinition
# warnings once Bundler is actually activated and
# `lib/bundler/vendored_net_http.rb` is required. This is not an issue in
# RubyGems versions including `rubygems/vendored_net_http` since `require` takes
# care of avoiding the double load.
#
unless defined?(Gem::Net)
  begin
    require "rubygems/vendored_net_http"
  rescue LoadError
    begin
      require "rubygems/net/http"
    rescue LoadError
      require "net/http"
      Gem::Net = Net
    end
  end
end
```
