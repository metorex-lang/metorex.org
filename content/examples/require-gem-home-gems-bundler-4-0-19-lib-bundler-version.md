---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/version.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-version
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/version.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/version.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/version.rb).

```metorex
# frozen_string_literal: false

module Bundler
  VERSION = "4.0.19".freeze

  def self.bundler_major_version
    @bundler_major_version ||= gem_version.segments.first
  end

  def self.gem_version
    @gem_version ||= Gem::Version.create(VERSION)
  end

  def self.verbose_version
    @verbose_version ||= "#{VERSION}#{simulated_version ? " (simulating Bundler #{simulated_version})" : ""}"
  end

  def self.simulated_version
    @simulated_version ||= Bundler.settings[:simulate_version]
  end
end
```
