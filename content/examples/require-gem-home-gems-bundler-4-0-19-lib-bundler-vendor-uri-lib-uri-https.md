---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/https.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-uri-lib-uri-https
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/https.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/https.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/https.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: false
# = uri/https.rb
#
# Author:: Akira Yamada <akira@ruby-lang.org>
# License:: You can redistribute it and/or modify it under the same term as Ruby.
#
# See Bundler::URI for general documentation
#

require_relative 'http'

module Bundler::URI

  # The default port for HTTPS URIs is 443, and the scheme is 'https:' rather
  # than 'http:'. Other than that, HTTPS URIs are identical to HTTP URIs;
  # see Bundler::URI::HTTP.
  class HTTPS < HTTP
    # A Default port of 443 for Bundler::URI::HTTPS
    DEFAULT_PORT = 443
  end

  register_scheme 'HTTPS', HTTPS
end
```
