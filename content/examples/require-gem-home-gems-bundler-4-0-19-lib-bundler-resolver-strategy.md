---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/strategy.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-resolver-strategy
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/strategy.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/strategy.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/strategy.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  class Resolver
    class Strategy
      def initialize(source)
        @source = source
        @package_priority_cache = {}
      end

      def next_package_and_version(unsatisfied)
        package, range = next_term_to_try_from(unsatisfied)

        [package, most_preferred_version_of(package, range).first]
      end

      private

      def next_term_to_try_from(unsatisfied)
        unsatisfied.min_by do |package, range|
          @package_priority_cache[[package, range]] ||= begin
            matching_versions = @source.versions_for(package, range)
            higher_versions = @source.versions_for(package, range.upper_invert)

            [matching_versions.count <= 1 ? 0 : 1, higher_versions.count]
          end
        end
      end

      def most_preferred_version_of(package, range)
        versions = @source.versions_for(package, range)

        # Conditional avoids (among other things) calling
        # sort_versions_by_preferred with the root package
        if versions.size > 1
          @source.sort_versions_by_preferred(package, versions)
        else
          versions
        end
      end
    end
  end
end
```
