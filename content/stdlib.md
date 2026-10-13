---
title: Standard library
slug: stdlib
description: Each default and bundled gem MRI 4.0.6 ships, with whether it loads under require in Metorex and where Metorex finds it.
layout: page
---

MRI 4.0.6 ships default gems, which are part of its standard library, and bundled gems, which are installed alongside it. The table lists each one, the name `require` takes for it, and what `require` does under Metorex and under MRI 4.0.6 on macOS.

The libraries that load are built into the Metorex binary, so `require` finds them with no gems installed. "Loaded at startup" means the library was already loaded when the program began, so `require` answered false. win32ole is for Windows, and it does not load under MRI on macOS either.

`bin/stdlib.raku` in the [metorex.org repository](https://github.com/metorex-lang/metorex.org){target=_blank rel=noopener} writes the table by running each `require` under both.

<!-- stdlib-table start -->

85 libraries, of which 68 load under Metorex.

| Library | Kind | Required as | Metorex | MRI |
| :-- | :-- | :-- | :-- | :-- |
| bundler | default | `bundler` | Does not load: LoadError: cannot load such file -- bundler | Loads |
| date | default | `date` | Loads, built into the binary | Loads |
| delegate | default | `delegate` | Loads, built into the binary | Loads |
| did_you_mean | default | `did_you_mean` | Loads, built into the binary | Loads |
| digest | default | `digest` | Loads, built into the binary | Loads |
| english | default | `English` | Loads, built into the binary | Loads |
| erb | default | `erb` | Loads, built into the binary | Loads |
| error_highlight | default | `error_highlight` | Loads, loaded at startup | Loads |
| etc | default | `etc` | Loads, built into the binary | Loads |
| fcntl | default | `fcntl` | Loads, built into the binary | Loads |
| fileutils | default | `fileutils` | Loads, built into the binary | Loads |
| find | default | `find` | Loads, built into the binary | Loads |
| forwardable | default | `forwardable` | Loads, built into the binary | Loads |
| io-console | default | `io/console` | Loads, built into the binary | Loads |
| io-nonblock | default | `io/nonblock` | Loads, built into the binary | Loads |
| io-wait | default | `io/wait` | Loads, built into the binary | Loads |
| ipaddr | default | `ipaddr` | Loads, built into the binary | Loads |
| json | default | `json` | Loads, built into the binary | Loads |
| net-http | default | `net/http` | Loads, built into the binary | Loads |
| net-protocol | default | `net/protocol` | Loads, built into the binary | Loads |
| open-uri | default | `open-uri` | Loads, built into the binary | Loads |
| open3 | default | `open3` | Loads, built into the binary | Loads |
| openssl | default | `openssl` | Loads, built into the binary | Loads |
| optparse | default | `optparse` | Loads, built into the binary | Loads |
| pp | default | `pp` | Loads, built into the binary | Loads |
| prettyprint | default | `prettyprint` | Loads, built into the binary | Loads |
| prism | default | `prism` | Loads, built into the binary | Loads |
| psych | default | `psych` | Loads, built into the binary | Loads |
| resolv | default | `resolv` | Loads, built into the binary | Loads |
| ruby2_keywords | default | `ruby2_keywords` | Loads, loaded at startup | Loads |
| securerandom | default | `securerandom` | Loads, built into the binary | Loads |
| shellwords | default | `shellwords` | Loads, built into the binary | Loads |
| singleton | default | `singleton` | Loads, built into the binary | Loads |
| stringio | default | `stringio` | Loads, loaded at startup | Loads |
| strscan | default | `strscan` | Loads, built into the binary | Loads |
| syntax_suggest | default | `syntax_suggest` | Loads, built into the binary | Loads |
| tempfile | default | `tempfile` | Loads, built into the binary | Loads |
| time | default | `time` | Loads, built into the binary | Loads |
| timeout | default | `timeout` | Loads, built into the binary | Loads |
| tmpdir | default | `tmpdir` | Loads, built into the binary | Loads |
| tsort | default | `tsort` | Loads, built into the binary | Loads |
| un | default | `un` | Loads, built into the binary | Loads |
| uri | default | `uri` | Loads, built into the binary | Loads |
| weakref | default | `weakref` | Loads, built into the binary | Loads |
| yaml | default | `yaml` | Loads, built into the binary | Loads |
| zlib | default | `zlib` | Loads, built into the binary | Loads |
| abbrev | bundled | `abbrev` | Loads, built into the binary | Loads |
| base64 | bundled | `base64` | Loads, built into the binary | Loads |
| benchmark | bundled | `benchmark` | Loads, built into the binary | Loads |
| bigdecimal | bundled | `bigdecimal` | Loads, built into the binary | Loads |
| csv | bundled | `csv` | Loads, built into the binary | Loads |
| debug | bundled | `debug` | Does not load: LoadError: cannot load such file -- debug | Loads |
| drb | bundled | `drb` | Loads, built into the binary | Loads |
| fiddle | bundled | `fiddle` | Loads, built into the binary | Loads |
| getoptlong | bundled | `getoptlong` | Loads, built into the binary | Loads |
| irb | bundled | `irb` | Loads, built into the binary | Loads |
| logger | bundled | `logger` | Loads, built into the binary | Loads |
| matrix | bundled | `matrix` | Loads, built into the binary | Loads |
| minitest | bundled | `minitest` | Does not load: LoadError: cannot load such file -- minitest | Loads |
| mutex_m | bundled | `mutex_m` | Loads, built into the binary | Loads |
| net-ftp | bundled | `net/ftp` | Loads, built into the binary | Loads |
| net-imap | bundled | `net/imap` | Does not load: LoadError: cannot load such file -- net/imap | Loads |
| net-pop | bundled | `net/pop` | Does not load: LoadError: cannot load such file -- net/pop | Loads |
| net-smtp | bundled | `net/smtp` | Does not load: LoadError: cannot load such file -- net/smtp | Loads |
| nkf | bundled | `nkf` | Loads, built into the binary | Loads |
| observer | bundled | `observer` | Loads, built into the binary | Loads |
| ostruct | bundled | `ostruct` | Loads, built into the binary | Loads |
| power_assert | bundled | `power_assert` | Does not load: LoadError: cannot load such file -- power_assert | Loads |
| prime | bundled | `prime` | Loads, built into the binary | Loads |
| pstore | bundled | `pstore` | Loads, built into the binary | Loads |
| racc | bundled | `racc` | Loads, built into the binary | Loads |
| rake | bundled | `rake` | Does not load: LoadError: cannot load such file -- rake | Loads |
| rbs | bundled | `rbs` | Does not load: LoadError: cannot load such file -- rbs | Loads |
| rdoc | bundled | `rdoc` | Does not load: LoadError: cannot load such file -- rdoc | Loads |
| readline | bundled | `readline` | Does not load: LoadError: cannot load such file -- readline | Loads |
| reline | bundled | `reline` | Loads, built into the binary | Loads |
| repl_type_completor | bundled | `repl_type_completor` | Does not load: LoadError: cannot load such file -- repl_type_completor | Loads |
| resolv-replace | bundled | `resolv-replace` | Loads, built into the binary | Loads |
| rexml | bundled | `rexml` | Does not load: LoadError: cannot load such file -- rexml | Loads |
| rinda | bundled | `rinda/rinda` | Loads, built into the binary | Loads |
| rss | bundled | `rss` | Does not load: LoadError: cannot load such file -- rss | Loads |
| syslog | bundled | `syslog` | Loads, built into the binary | Loads |
| test-unit | bundled | `test-unit` | Does not load: LoadError: cannot load such file -- test-unit | Loads |
| typeprof | bundled | `typeprof` | Does not load: LoadError: cannot load such file -- typeprof | Loads |
| win32ole | bundled | `win32ole` | Does not load: LoadError: cannot load such file -- win32ole | Does not load: LoadError: cannot load such file -- win32ole |

<!-- stdlib-table end -->
