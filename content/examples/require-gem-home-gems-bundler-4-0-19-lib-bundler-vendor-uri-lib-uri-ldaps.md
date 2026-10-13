---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/ldaps.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-uri-lib-uri-ldaps
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/ldaps.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/ldaps.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/ldaps.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: false
# = uri/ldap.rb
#
# License:: You can redistribute it and/or modify it under the same term as Ruby.
#
# See Bundler::URI for general documentation
#

require_relative 'ldap'

module Bundler::URI

  # The default port for LDAPS URIs is 636, and the scheme is 'ldaps:' rather
  # than 'ldap:'. Other than that, LDAPS URIs are identical to LDAP URIs;
  # see Bundler::URI::LDAP.
  class LDAPS < LDAP
    # A Default port of 636 for Bundler::URI::LDAPS
    DEFAULT_PORT = 636
  end

  register_scheme 'LDAPS', LDAPS
end
```
