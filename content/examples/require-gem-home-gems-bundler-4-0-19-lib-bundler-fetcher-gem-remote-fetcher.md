---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/gem_remote_fetcher.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-fetcher-gem-remote-fetcher
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/gem_remote_fetcher.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/gem_remote_fetcher.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/gem_remote_fetcher.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

require "rubygems/remote_fetcher"

module Bundler
  class Fetcher
    class GemRemoteFetcher < Gem::RemoteFetcher
      def initialize(*)
        super

        @pool_size = Bundler.settings.installation_parallelization
        ssl_ca_cert = Bundler.settings[:ssl_ca_cert]
        @cert_files << ssl_ca_cert if ssl_ca_cert
      end

      def request(*args)
        super do |req|
          req.delete("User-Agent") if headers["User-Agent"]
          yield req if block_given?
        end
      end
    end
  end
end
```
