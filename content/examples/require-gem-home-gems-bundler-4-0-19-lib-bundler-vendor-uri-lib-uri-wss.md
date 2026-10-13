---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/wss.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-uri-lib-uri-wss
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/wss.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/wss.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/wss.rb).

```metorex
# frozen_string_literal: false
# = uri/wss.rb
#
# Author:: Matt Muller <mamuller@amazon.com>
# License:: You can redistribute it and/or modify it under the same term as Ruby.
#
# See Bundler::URI for general documentation
#

require_relative 'ws'

module Bundler::URI

  # The default port for WSS URIs is 443, and the scheme is 'wss:' rather
  # than 'ws:'. Other than that, WSS URIs are identical to WS URIs;
  # see Bundler::URI::WS.
  class WSS < WS
    # A Default port of 443 for Bundler::URI::WSS
    DEFAULT_PORT = 443
  end

  register_scheme 'WSS', WSS
end
```
