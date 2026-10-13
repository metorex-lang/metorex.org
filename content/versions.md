---
title: Versions
slug: versions
description: Metorex's own version number, the MRI release it follows and reports, and the RSpec version Rex targets.
layout: page
---

Metorex has two version numbers. Its own, now 0.1.0, is the version of the metorex package and changes with each Metorex release. The other is the MRI release Metorex follows, now 4.0.6, which is the Ruby version it reports to programs.

## What a program sees

`RUBY_VERSION` and `RUBY_ENGINE_VERSION` are the MRI release Metorex follows, and `RUBY_ENGINE` is `ruby`, so a library that checks the version or the engine treats Metorex as MRI. `RSpec::Core::Version::STRING` is the RSpec release [Rex](/rex) reports.

```metorex
require "rspec/core"

p [RUBY_ENGINE, RUBY_VERSION, RUBY_ENGINE_VERSION]
puts RSpec::Core::Version::STRING
```

```
["ruby", "4.0.6", "4.0.6"]
3.13.6
```

The `METOREX_RUBY_VERSION` environment variable names another release for Metorex to report, so a program or a spec suite can be run against the version checks of that release. Only the reported number changes.

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
metorex 4.0.6 (ruby-compatible) [arm64-darwin]
```

## Releases

| Metorex | MRI version followed | RSpec version Rex targets |
| :-- | :-- | :-- |
| 0.1.0 | 4.0.6 | 3.13 |

The sample on this page is `tests/_examples/site/versions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex), where the test suite checks its output under both versions.
