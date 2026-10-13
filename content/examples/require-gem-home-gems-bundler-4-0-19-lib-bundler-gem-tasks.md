---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/gem_tasks.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-gem-tasks
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/gem_tasks.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/gem_tasks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/gem_tasks.rb){target=_blank rel=noopener}.

```metorex
# frozen_string_literal: true

require "rake/clean"
CLOBBER.include "pkg"

require_relative "gem_helper"
Bundler::GemHelper.install_tasks
```
