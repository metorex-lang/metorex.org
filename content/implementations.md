---
title: Ruby Implementations Compared
slug: implementations
description: Metorex beside CRuby, JRuby, TruffleRuby, mruby, and Artichoke, by implementation language, Ruby version, ruby/spec results, C extension support, and license.
layout: page
---

As of October 13, 2026.

| Implementation | Written in | Ruby | ruby/spec | C extensions | License |
| :-- | :-- | :-- | :-- | :-- | :-- |
| CRuby | [Ruby, C](https://github.com/ruby/ruby){target=_blank rel=noopener} | [4.0.7](https://www.ruby-lang.org/en/downloads/){target=_blank rel=noopener} | [Every commit](https://github.com/ruby/spec#readme){target=_blank rel=noopener} | [Yes](https://docs.ruby-lang.org/en/master/extension_rdoc.html){target=_blank rel=noopener} | [Ruby, BSD-2-Clause](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener} |
| JRuby | [Ruby, Java](https://github.com/jruby/jruby){target=_blank rel=noopener} | [4.0](https://www.jruby.org/){target=_blank rel=noopener} | [Every commit](https://github.com/ruby/spec#readme){target=_blank rel=noopener} | [No](https://github.com/jruby/jruby/wiki/C-Extension-Alternatives){target=_blank rel=noopener} | [EPL, GPL, LGPL](https://github.com/jruby/jruby#readme){target=_blank rel=noopener} |
| TruffleRuby | [Ruby, C, Java](https://github.com/oracle/truffleruby){target=_blank rel=noopener} | [4.0](https://github.com/oracle/truffleruby#readme){target=_blank rel=noopener} | [About 98%](https://github.com/oracle/truffleruby#readme){target=_blank rel=noopener} | [Many](https://github.com/oracle/truffleruby#readme){target=_blank rel=noopener} | [EPL, GPL, LGPL](https://github.com/oracle/truffleruby#readme){target=_blank rel=noopener} |
| mruby | [C, Ruby](https://github.com/mruby/mruby){target=_blank rel=noopener} | [ISO subset](https://github.com/mruby/mruby#readme){target=_blank rel=noopener} | [Not listed](https://github.com/ruby/spec#readme){target=_blank rel=noopener} | [Its own API](https://github.com/mruby/mruby#readme){target=_blank rel=noopener} | [MIT](https://github.com/mruby/mruby#readme){target=_blank rel=noopener} |
| Artichoke | [Rust, Ruby](https://github.com/artichoke/artichoke){target=_blank rel=noopener} | [3.1.2](https://github.com/artichoke/artichoke/blob/trunk/RUBYSPEC.md){target=_blank rel=noopener} | [A subset](https://github.com/artichoke/artichoke/blob/trunk/RUBYSPEC.md){target=_blank rel=noopener} | [No](https://github.com/artichoke/artichoke/blob/trunk/artichoke-backend/README.md){target=_blank rel=noopener} | [MIT](https://github.com/artichoke/artichoke#readme){target=_blank rel=noopener} |
| Metorex | [Rust, Ruby](https://github.com/metorex-lang/metorex){target=_blank rel=noopener} | [4.0.7](https://github.com/metorex-lang/metorex/blob/main/src/lib.rs){target=_blank rel=noopener} | [Passes](https://github.com/metorex-lang/metorex#readme){target=_blank rel=noopener} | [Much of MRI's](https://github.com/metorex-lang/metorex#readme){target=_blank rel=noopener} | [MIT](https://github.com/metorex-lang/metorex/blob/main/LICENSE){target=_blank rel=noopener} |

**CRuby** is MRI, the reference implementation. ruby/spec runs for every commit on 30 platforms, and C extensions use its C API.

**JRuby** 10.1 targets Ruby 4.0. It runs Java extensions in place of C extensions. Its license is EPL-2.0, GPL-2.0, or LGPL-2.1.

**TruffleRuby** 40.0 targets Ruby 4.0 and runs on GraalVM's Truffle. Many C extensions work unchanged. Its license is EPL-2.0, GPL-2.0, or LGPL-2.1.

**mruby** implements part of the ISO standard, with Ruby 4.x syntax. It is not among the implementations ruby/spec lists, and its extensions are mrbgems written against its own C API.

**Artichoke** targets recent MRI and runs ruby/spec against 3.1.2, enforcing a subset with many failures. Its extensions are Rust, on mruby's ABI.

**Metorex** passes ruby/spec's core, library, language, command_line, optional, and security directories, and exports much of MRI's C API.