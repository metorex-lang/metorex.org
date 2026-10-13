---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/match_remote_metadata.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-match-remote-metadata
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/match_remote_metadata.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/match_remote_metadata.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/match_remote_metadata.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  module FetchMetadata
    # A fallback is included because the original version of the specification
    # API didn't include that field, so some marshalled specs in the index have it
    # set to +nil+.
    def matches_current_ruby?
      @required_ruby_version ||= _remote_specification.required_ruby_version || Gem::Requirement.default

      super
    end

    def matches_current_rubygems?
      # A fallback is included because the original version of the specification
      # API didn't include that field, so some marshalled specs in the index have it
      # set to +nil+.
      @required_rubygems_version ||= _remote_specification.required_rubygems_version || Gem::Requirement.default

      super
    end
  end

  module MatchRemoteMetadata
    include MatchMetadata

    prepend FetchMetadata
  end
end
```
