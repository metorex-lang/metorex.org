---
title: Ruby implementations compared
slug: implementations
description: Metorex beside CRuby, JRuby, TruffleRuby, mruby, and Artichoke, by implementation language, Ruby version, ruby/spec results, C extension support, and license.
layout: page
---

Each cell links to the page it was read from. The pages were read on October 13, 2026.

| Implementation | Written in | Ruby version | ruby/spec | C extensions | License |
| :-- | :-- | :-- | :-- | :-- | :-- |
| CRuby | [Ruby and C](https://github.com/ruby/ruby) | [4.0.7, the current stable release](https://www.ruby-lang.org/en/downloads/) | [Run for every commit, on 30 platforms](https://github.com/ruby/spec#readme) | [Yes, through its C API](https://docs.ruby-lang.org/en/master/extension_rdoc.html) | [Ruby's license or BSD-2-Clause](https://www.ruby-lang.org/en/about/license.txt) |
| JRuby | [Ruby and Java](https://github.com/jruby/jruby) | [4.0, in JRuby 10.1](https://www.jruby.org/) | [Run for every commit](https://github.com/ruby/spec#readme) | [No, Java extensions instead](https://github.com/jruby/jruby/wiki/C-Extension-Alternatives) | [EPL-2.0, GPL-2.0, or LGPL-2.1](https://github.com/jruby/jruby#readme) |
| TruffleRuby | [Ruby, C, and Java, on GraalVM's Truffle](https://github.com/oracle/truffleruby) | [4.0, in TruffleRuby 40.0](https://github.com/oracle/truffleruby#readme) | [About 98% passing](https://github.com/oracle/truffleruby#readme) | [Many work as they are](https://github.com/oracle/truffleruby#readme) | [EPL-2.0, GPL-2.0, or LGPL-2.1](https://github.com/oracle/truffleruby#readme) |
| mruby | [C and Ruby](https://github.com/mruby/mruby) | [Part of the ISO standard, with Ruby 4.x syntax](https://github.com/mruby/mruby#readme) | [Not among the implementations ruby/spec lists](https://github.com/ruby/spec#readme) | [Its own C API, through mrbgems](https://github.com/mruby/mruby#readme) | [MIT](https://github.com/mruby/mruby#readme) |
| Artichoke | [Rust and Ruby](https://github.com/artichoke/artichoke) | [Recent MRI, no release named](https://github.com/artichoke/artichoke#readme) | [A subset is enforced, with many failures](https://github.com/artichoke/artichoke/blob/trunk/RUBYSPEC.md) | [Rust extensions on mruby's ABI, not MRI's C API](https://github.com/artichoke/artichoke/blob/trunk/artichoke-backend/README.md) | [MIT](https://github.com/artichoke/artichoke#readme) |
| Metorex | [Rust and Ruby](https://github.com/metorex-lang/metorex) | [4.0.6](https://github.com/metorex-lang/metorex/blob/main/src/lib.rs) | [Passes core, library, language, command_line, optional, and security](https://github.com/metorex-lang/metorex#readme) | [MRI's C API, much of it](https://github.com/metorex-lang/metorex#readme) | [MIT](https://github.com/metorex-lang/metorex/blob/main/LICENSE) |

The languages are the ones each repository holds the most of, in GitHub's count of its files, in that order.
