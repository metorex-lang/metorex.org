---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/safe_marshal.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-safe-marshal
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/safe_marshal.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/safe_marshal.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/safe_marshal.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

module Bundler
  module SafeMarshal
    ALLOWED_CLASSES = [
      Array,
      FalseClass,
      Gem::Specification,
      Gem::Version,
      Hash,
      String,
      Symbol,
      Time,
      TrueClass,
    ].freeze

    ERROR = "Unexpected class %s present in marshaled data. Only %s are allowed."

    PROC = proc do |object|
      object.tap do
        unless ALLOWED_CLASSES.include?(object.class)
          raise TypeError, format(ERROR, object.class, ALLOWED_CLASSES.join(", "))
        end
      end
    end

    def self.proc
      PROC
    end
  end
end
```
