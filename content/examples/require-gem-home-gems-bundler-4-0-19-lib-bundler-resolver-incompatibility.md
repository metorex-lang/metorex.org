---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/incompatibility.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-resolver-incompatibility
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/incompatibility.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/incompatibility.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/resolver/incompatibility.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class Resolver
    class Incompatibility < PubGrub::Incompatibility
      attr_reader :extended_explanation

      def initialize(terms, cause:, custom_explanation: nil, extended_explanation: nil)
        @extended_explanation = extended_explanation

        super(terms, cause: cause, custom_explanation: custom_explanation)
      end
    end
  end
end
```
