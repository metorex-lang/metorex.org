---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/uri_normalizer.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-uri-normalizer
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/uri_normalizer.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/uri_normalizer.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/uri_normalizer.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  module URINormalizer
    module_function

    # Normalizes uri to a consistent version, either with or without trailing
    # slash.
    #
    # TODO: Currently gem sources are locked with a trailing slash, while git
    # sources are locked without a trailing slash. This should be normalized but
    # the inconsistency is there for now to avoid changing all lockfiles
    # including GIT sources. We could normalize this on the next major.
    #
    def normalize_suffix(uri, trailing_slash: true)
      if trailing_slash
        uri.end_with?("/") ? uri : "#{uri}/"
      else
        uri.end_with?("/") ? uri.delete_suffix("/") : uri
      end
    end
  end
end
```
