---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/base.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-fetcher-base
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/base.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/base.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/fetcher/base.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  class Fetcher
    class Base
      attr_reader :downloader
      attr_reader :display_uri
      attr_reader :remote
      attr_reader :gem_remote_fetcher

      def initialize(downloader, remote, display_uri, gem_remote_fetcher)
        raise "Abstract class" if self.class == Base
        @downloader = downloader
        @remote = remote
        @display_uri = display_uri
        @gem_remote_fetcher = gem_remote_fetcher
      end

      def remote_uri
        @remote.uri
      end

      def fetch_uri
        @fetch_uri ||= if remote_uri.host == "rubygems.org"
          uri = remote_uri.dup
          uri.host = "index.rubygems.org"
          uri
        else
          remote_uri
        end
      end

      def available?
        true
      end

      def api_fetcher?
        false
      end

      def release_resolution_memory!
      end

      private

      def log_specs(&block)
        if Bundler.ui.debug?
          Bundler.ui.debug yield
        else
          Bundler.ui.info ".", false
        end
      end
    end
  end
end
```
