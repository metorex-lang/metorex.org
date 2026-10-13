---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/net-http-persistent/lib/net/http/persistent/connection.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-net-http-persistent-lib-net-http-persistent-connection
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/net-http-persistent/lib/net/http/persistent/connection.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/net-http-persistent/lib/net/http/persistent/connection.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/net-http-persistent/lib/net/http/persistent/connection.rb){target=_blank rel=noopener}.

```metorex
##
# A Gem::Net::HTTP connection wrapper that holds extra information for managing the
# connection's lifetime.

class Gem::Net::HTTP::Persistent::Connection # :nodoc:

  attr_accessor :http

  attr_accessor :last_use

  attr_accessor :requests

  attr_accessor :ssl_generation

  def initialize http_class, http_args, ssl_generation
    @http           = http_class.new(*http_args)
    @ssl_generation = ssl_generation

    reset
  end

  def finish
    @http.finish
  rescue IOError
  ensure
    reset
  end
  alias_method :close, :finish

  def reset
    @last_use = Gem::Net::HTTP::Persistent::EPOCH
    @requests = 0
  end

  def ressl ssl_generation
    @ssl_generation = ssl_generation

    finish
  end

end
```
