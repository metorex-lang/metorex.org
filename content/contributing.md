---
title: Contributing
slug: contributing
description: How to build Metorex from source, run its tests and the ruby/spec suite, and send a change.
layout: page
---

Metorex is developed in the [metorex repository](https://github.com/metorex-lang/metorex) on GitHub. Issues and pull requests go there, and a contribution is licensed under the MIT License.

## What you need

- Rust 1.85 or newer, since Metorex uses the 2024 edition.
- A C compiler on your `PATH` as `cc`, and `ar`. The build compiles the bundled Prism and nkf sources.
- MRI 4.0.6 as `ruby`, for running the ruby/spec suite and the benchmarks. mspec, the suite's driver, runs under MRI, and each spec file runs under Metorex.
- Docker, for running the Linux checks.

## Getting the source

The ruby/spec suite and mspec are git submodules under `ruby/`.

```sh
git clone https://github.com/metorex-lang/metorex.git
cd metorex
git submodule update --init
```

## Building and running

```sh
cargo build
cargo run -- tests/_examples/cli_flags/good_syntax.rb
cargo run
```

`cargo run` with no file starts the REPL. The binary is `target/debug/metorex`, and the [command line](/cli) page lists its options.

## Running the tests

```sh
cargo test
scripts/run_ruby_spec.sh
```

`cargo test` runs the Rust tests and the example programs under `tests/_examples`, each checked against its expected output. `scripts/run_ruby_spec.sh` runs the ruby/spec files Metorex passes, in parallel, one worker per CPU unless `JOBS` says otherwise.

Before sending a change, run:

```sh
cargo fmt --check
cargo clippy --all-targets
scripts/misplaced_tests.sh
```

`scripts/misplaced_tests.sh` lists any test written in `src/`. Tests go in `tests/`, and none go in implementation files, including doc tests.

Coverage is measured with cargo-llvm-cov, and the target is 100%:

```sh
rustup component add llvm-tools-preview
cargo install cargo-llvm-cov
cargo llvm-cov --ignore-filename-regex 'ruby/'
```

## Running what CI runs

`./test.sh` runs formatting, clippy, the Rust tests, the ruby/spec suite, coverage, and the misplaced test check, on this machine and in Linux containers for both architectures. It stops at the first step that fails.

```sh
./test.sh
./test.sh mac
./test.sh linux-amd64
```

`scripts/linux.sh` runs one command against a Linux build in the image CI uses, with the working tree mounted. `LINUX_ARCH` picks `amd64` or `arm64`.

```sh
scripts/linux.sh cargo test
LINUX_ARCH=amd64 scripts/linux.sh scripts/run_ruby_spec.sh
```

## Sending a change

Fork the repository, work on a branch, and open a pull request describing the change. Add tests for new functionality, and make sure the checks above pass first.

## Reporting an issue

Include the output of `metorex -V` and `rustc --version`, the operating system, the program or steps that show the problem, and what happened beside what you expected.
