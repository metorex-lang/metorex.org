---
title: Standard library
slug: stdlib
description: Each default and bundled gem MRI 4.0.6 ships, with whether it loads under require in Metorex and where Metorex finds it.
layout: page
---

MRI 4.0.6 ships default gems, which are part of its standard library, and bundled gems, which are installed alongside it. The table lists each one, the name `require` takes for it, and what `require` does under Metorex and under MRI 4.0.6 on macOS.

Metorex carries the libraries that load in its binary, so `require` finds them with no gems installed. "Loaded at startup" means the library was already loaded when the program began, so `require` answered false. win32ole is for Windows, and it does not load under MRI on macOS either.

`bin/stdlib.raku` in the [metorex.org repository](https://github.com/metorex-lang/metorex.org) writes the table by running each `require` under both.

<!-- stdlib-table start -->

85 libraries, of which 68 load under Metorex.

| Library | Kind | Required as | Metorex | MRI |
| :-- | :-- | :-- | :-- | :-- |
| bundler | default | `bundler` | Does not load: LoadError: cannot load such file -- bundler | Loads |
| date | default | `date` | Loads, carried in the binary | Loads |
| delegate | default | `delegate` | Loads, carried in the binary | Loads |
| did_you_mean | default | `did_you_mean` | Loads, carried in the binary | Loads |
| digest | default | `digest` | Loads, carried in the binary | Loads |
| english | default | `English` | Loads, carried in the binary | Loads |
| erb | default | `erb` | Loads, carried in the binary | Loads |
| error_highlight | default | `error_highlight` | Loads, loaded at startup | Loads |
| etc | default | `etc` | Loads, carried in the binary | Loads |
| fcntl | default | `fcntl` | Loads, carried in the binary | Loads |
| fileutils | default | `fileutils` | Loads, carried in the binary | Loads |
| find | default | `find` | Loads, carried in the binary | Loads |
| forwardable | default | `forwardable` | Loads, carried in the binary | Loads |
| io-console | default | `io/console` | Loads, carried in the binary | Loads |
| io-nonblock | default | `io/nonblock` | Loads, carried in the binary | Loads |
| io-wait | default | `io/wait` | Loads, carried in the binary | Loads |
| ipaddr | default | `ipaddr` | Loads, carried in the binary | Loads |
| json | default | `json` | Loads, carried in the binary | Loads |
| net-http | default | `net/http` | Loads, carried in the binary | Loads |
| net-protocol | default | `net/protocol` | Loads, carried in the binary | Loads |
| open-uri | default | `open-uri` | Loads, carried in the binary | Loads |
| open3 | default | `open3` | Loads, carried in the binary | Loads |
| openssl | default | `openssl` | Loads, carried in the binary | Loads |
| optparse | default | `optparse` | Loads, carried in the binary | Loads |
| pp | default | `pp` | Loads, carried in the binary | Loads |
| prettyprint | default | `prettyprint` | Loads, carried in the binary | Loads |
| prism | default | `prism` | Loads, carried in the binary | Loads |
| psych | default | `psych` | Loads, carried in the binary | Loads |
| resolv | default | `resolv` | Loads, carried in the binary | Loads |
| ruby2_keywords | default | `ruby2_keywords` | Loads, loaded at startup | Loads |
| securerandom | default | `securerandom` | Loads, carried in the binary | Loads |
| shellwords | default | `shellwords` | Loads, carried in the binary | Loads |
| singleton | default | `singleton` | Loads, carried in the binary | Loads |
| stringio | default | `stringio` | Loads, loaded at startup | Loads |
| strscan | default | `strscan` | Loads, carried in the binary | Loads |
| syntax_suggest | default | `syntax_suggest` | Loads, carried in the binary | Loads |
| tempfile | default | `tempfile` | Loads, carried in the binary | Loads |
| time | default | `time` | Loads, carried in the binary | Loads |
| timeout | default | `timeout` | Loads, carried in the binary | Loads |
| tmpdir | default | `tmpdir` | Loads, carried in the binary | Loads |
| tsort | default | `tsort` | Loads, carried in the binary | Loads |
| un | default | `un` | Loads, carried in the binary | Loads |
| uri | default | `uri` | Loads, carried in the binary | Loads |
| weakref | default | `weakref` | Loads, carried in the binary | Loads |
| yaml | default | `yaml` | Loads, carried in the binary | Loads |
| zlib | default | `zlib` | Loads, carried in the binary | Loads |
| abbrev | bundled | `abbrev` | Loads, carried in the binary | Loads |
| base64 | bundled | `base64` | Loads, carried in the binary | Loads |
| benchmark | bundled | `benchmark` | Loads, carried in the binary | Loads |
| bigdecimal | bundled | `bigdecimal` | Loads, carried in the binary | Loads |
| csv | bundled | `csv` | Loads, carried in the binary | Loads |
| debug | bundled | `debug` | Does not load: LoadError: cannot load such file -- debug | Loads |
| drb | bundled | `drb` | Loads, carried in the binary | Loads |
| fiddle | bundled | `fiddle` | Loads, carried in the binary | Loads |
| getoptlong | bundled | `getoptlong` | Loads, carried in the binary | Loads |
| irb | bundled | `irb` | Loads, carried in the binary | Loads |
| logger | bundled | `logger` | Loads, carried in the binary | Loads |
| matrix | bundled | `matrix` | Loads, carried in the binary | Loads |
| minitest | bundled | `minitest` | Does not load: LoadError: cannot load such file -- minitest | Loads |
| mutex_m | bundled | `mutex_m` | Loads, carried in the binary | Loads |
| net-ftp | bundled | `net/ftp` | Loads, carried in the binary | Loads |
| net-imap | bundled | `net/imap` | Does not load: LoadError: cannot load such file -- net/imap | Loads |
| net-pop | bundled | `net/pop` | Does not load: LoadError: cannot load such file -- net/pop | Loads |
| net-smtp | bundled | `net/smtp` | Does not load: LoadError: cannot load such file -- net/smtp | Loads |
| nkf | bundled | `nkf` | Loads, carried in the binary | Loads |
| observer | bundled | `observer` | Loads, carried in the binary | Loads |
| ostruct | bundled | `ostruct` | Loads, carried in the binary | Loads |
| power_assert | bundled | `power_assert` | Does not load: LoadError: cannot load such file -- power_assert | Loads |
| prime | bundled | `prime` | Loads, carried in the binary | Loads |
| pstore | bundled | `pstore` | Loads, carried in the binary | Loads |
| racc | bundled | `racc` | Loads, carried in the binary | Loads |
| rake | bundled | `rake` | Does not load: LoadError: cannot load such file -- rake | Loads |
| rbs | bundled | `rbs` | Does not load: LoadError: cannot load such file -- rbs | Loads |
| rdoc | bundled | `rdoc` | Does not load: LoadError: cannot load such file -- rdoc | Loads |
| readline | bundled | `readline` | Does not load: LoadError: cannot load such file -- readline | Loads |
| reline | bundled | `reline` | Loads, carried in the binary | Loads |
| repl_type_completor | bundled | `repl_type_completor` | Does not load: LoadError: cannot load such file -- repl_type_completor | Loads |
| resolv-replace | bundled | `resolv-replace` | Loads, carried in the binary | Loads |
| rexml | bundled | `rexml` | Does not load: LoadError: cannot load such file -- rexml | Loads |
| rinda | bundled | `rinda/rinda` | Loads, carried in the binary | Loads |
| rss | bundled | `rss` | Does not load: LoadError: cannot load such file -- rss | Loads |
| syslog | bundled | `syslog` | Loads, carried in the binary | Loads |
| test-unit | bundled | `test-unit` | Does not load: LoadError: cannot load such file -- test-unit | Loads |
| typeprof | bundled | `typeprof` | Does not load: LoadError: cannot load such file -- typeprof | Loads |
| win32ole | bundled | `win32ole` | Does not load: LoadError: cannot load such file -- win32ole | Does not load: LoadError: cannot load such file -- win32ole |

<!-- stdlib-table end -->
