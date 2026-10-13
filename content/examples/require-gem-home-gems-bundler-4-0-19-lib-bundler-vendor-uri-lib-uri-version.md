---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/version.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-uri-lib-uri-version
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/version.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/version.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/uri/lib/uri/version.rb).

```metorex
module Bundler::URI
  # :stopdoc:
  VERSION = '1.1.1'.freeze
  VERSION_CODE = VERSION.split('.').map{|s| s.rjust(2, '0')}.join.freeze
  # :startdoc:
end
```
