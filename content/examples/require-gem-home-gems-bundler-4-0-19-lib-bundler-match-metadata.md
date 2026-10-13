---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/match_metadata.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-match-metadata
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/match_metadata.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/match_metadata.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/match_metadata.rb).

```metorex
# frozen_string_literal: true

module Bundler
  module MatchMetadata
    def matches_current_metadata?
      matches_current_ruby? && matches_current_rubygems?
    end

    def matches_current_ruby?
      @required_ruby_version.satisfied_by?(Gem.ruby_version)
    end

    def matches_current_rubygems?
      @required_rubygems_version.satisfied_by?(Gem.rubygems_version)
    end

    def expanded_dependencies
      runtime_dependencies + [
        metadata_dependency("Ruby", @required_ruby_version),
        metadata_dependency("RubyGems", @required_rubygems_version),
      ].compact
    end

    def metadata_dependency(name, requirement)
      return if requirement.nil? || requirement.none?

      Gem::Dependency.new("#{name}\0", requirement)
    end
  end
end
```
