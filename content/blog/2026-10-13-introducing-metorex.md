---
title: Introducing Metorex
date: 2026-10-13
slug: introducing-metorex
description: Metorex is a Ruby interpreter written in Rust that passes the ruby/spec suite, includes an RSpec-compatible spec framework, and returns a program's syntax tree to it as hashes. This site documents it.
tags: [announcements]
archives: [2026-10]
---

Metorex is a Ruby interpreter written in Rust. It follows MRI 4.0.6: `RUBY_VERSION` reports 4.0.6, and the ruby/spec files it runs (core, library, language, command_line, optional, and security) pass with no failures. [Differences from MRI](/ruby-differences) lists the places where it answers differently on purpose.

## What it includes

- [Rex](/rex), a spec framework that runs suites written for RSpec 3.13 with `metorex spec` and no gems installed. The RSpec libraries' own suites run under it.
- The libraries MRI ships, held in the binary. The [standard library](/stdlib) page lists which of MRI's default and bundled gems load.
- MRI's C API, so C extensions such as nkf load. [C extensions](/c-extensions) lists the functions it exports.
- [Code as objects](/meta): `parse` and a method's `body` answer the syntax tree the interpreter runs, as hashes a program can read.

## What it does not do yet

Metorex runs the syntax tree directly and is slower than CRuby. The workload scripts on the [benchmarks](/benchmarks) page take 5.5 to 22.9 times as long under it. The [Beyond Ruby](/beyond-ruby) page lists features the README names that are not built yet.

## This site

- [Install](/install) builds Metorex from source.
- The [language tour](/language) runs through Ruby under Metorex, each sample with its output.
- The [command line](/cli) page covers every flag.
- The [docs](/docs) include a [core reference](/docs/core) with one page per class ruby/spec describes, marking each method Metorex implements.
- The [examples](/examples) gallery shows each example program in the metorex repository with the output its test checks.

The source is at [github.com/metorex-lang/metorex](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, and [Contributing](/contributing) covers building it and running the tests.
