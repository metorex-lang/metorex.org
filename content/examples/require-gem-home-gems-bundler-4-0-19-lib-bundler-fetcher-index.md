---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/index.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-fetcher-index
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/index.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/index.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/index.rb).

```metorex
# frozen_string_literal: true

require_relative "base"

module Bundler
  class Fetcher
    class Index < Base
      def specs(_gem_names)
        Bundler.rubygems.fetch_all_remote_specs(remote, gem_remote_fetcher)
      rescue Gem::RemoteFetcher::FetchError => e
        case e.message
        when /certificate verify failed/
          raise CertificateFailureError.new(display_uri)
        when /401/
          raise BadAuthenticationError, remote_uri if remote_uri.userinfo
          raise AuthenticationRequiredError, remote_uri
        when /403/
          raise AuthenticationForbiddenError, remote_uri
        else
          raise HTTPError, "Could not fetch specs from #{display_uri} due to underlying error <#{e.message}>"
        end
      end
    end
  end
end
```
