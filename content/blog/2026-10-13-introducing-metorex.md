---
title: Introducing Metorex
date: 2026-10-13
slug: introducing-metorex
description: Metorex is a Ruby interpreter written in Rust that passes the ruby/spec suite, includes an RSpec-compatible spec framework, and returns a program's syntax tree to it as hashes. This site documents it.
tags: [announcements]
archives: [2026-10]
---

Metorex is a Ruby interpreter written in Rust. It follows MRI 4.0.6: `RUBY_VERSION` reports 4.0.6, and the ruby/spec files it runs (core, library, language, command_line, optional, and security) pass with no failures. [Differences from MRI](/docs/ruby-differences) lists the places where it answers differently on purpose.

## What It Includes

- [Rex](/docs/rex), a spec framework that runs suites written for RSpec 3.13 with `metorex spec` and no gems installed.
- Libraries MRI ships, held in the binary. The [standard library](/docs/stdlib) page lists which of MRI's default and bundled gems load.
- MRI's C API, so C extensions such as nkf load. [C extensions](/docs/c-extensions) lists the functions it exports.
- [Code as objects](/docs/meta): `parse` and a method's `body` answer the syntax tree the interpreter runs, as hashes a program can read.

## What It Does Not Do Yet

Metorex runs the syntax tree directly and is slower than CRuby. The workload scripts in the metorex repository's `benchmarks/` directory take 5.5 to 22.9 times as long under it as under CRuby.

## This Site

- [Install](/install) builds Metorex from source.
- The [language tour](/language) runs through Ruby under Metorex, each sample with its output.
- The [command line](/docs/cli) page covers every flag.
- The [docs](/docs) cover Rex, code as objects, C extensions, the standard library, and where Metorex differs from MRI.

The source is at [github.com/metorex-lang/metorex](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, and [Contributing](/contributing) covers building it and running the tests.
