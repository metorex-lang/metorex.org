---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/assignment.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-pub-grub-lib-pub-grub-assignment
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/assignment.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/assignment.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/vendor/pub_grub/lib/pub_grub/assignment.rb){target=_blank rel=noopener}.

```metorex
module Bundler::PubGrub
  class Assignment
    attr_reader :term, :cause, :decision_level, :index
    def initialize(term, cause, decision_level, index)
      @term = term
      @cause = cause
      @decision_level = decision_level
      @index = index
    end

    def self.decision(package, version, decision_level, index)
      term = Term.new(VersionConstraint.exact(package, version), true)
      new(term, :decision, decision_level, index)
    end

    def decision?
      cause == :decision
    end
  end
end
```
