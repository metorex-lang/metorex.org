---
title: Versions
slug: versions
description: Metorex's own version number, the MRI release it follows and reports, and the RSpec version Rex targets.
layout: page
---

Metorex has two version numbers. Its own is the version of the metorex package and changes with each Metorex release. The other is the MRI release Metorex follows, which is the Ruby version it reports to programs.

## What a Program Sees

`RUBY_VERSION` and `RUBY_ENGINE_VERSION` are the MRI release Metorex follows, and `RUBY_ENGINE` is `ruby`, so a library that checks the version or the engine treats Metorex as MRI. `RSpec::Core::Version::STRING` is the RSpec release [Rex](/docs/rex) reports.

```ruby
require "rspec/core"

p [RUBY_ENGINE, RUBY_VERSION, RUBY_ENGINE_VERSION]
puts RSpec::Core::Version::STRING
```

```
["ruby", "4.0.7", "4.0.7"]
3.13.6
```

The `METOREX_RUBY_VERSION` environment variable names another release for Metorex to report, so a program or a spec suite can be run against the version checks of that release. `RUBY_VERSION`, `RUBY_ENGINE_VERSION`, `RUBY_DESCRIPTION`, and the versioned library directory on the load path change to that release.

```
$ METOREX_RUBY_VERSION=3.4.5 metorex versions.rb
["ruby", "3.4.5", "3.4.5"]
3.13.6
```

`metorex -V` prints Metorex's own version, and `metorex -v` prints `RUBY_DESCRIPTION`:

```
$ metorex -V
metorex 0.1.0
$ metorex -v
metorex 4.0.7 (ruby-compatible) [arm64-darwin]
```

## Releases

| Metorex | MRI version followed | RSpec version Rex targets |
| :-- | :-- | :-- |
| 0.1.0 | 4.0.7 | 3.13 |
