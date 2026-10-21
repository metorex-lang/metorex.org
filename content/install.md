---
title: Install
description: Build Metorex from source with Cargo, then run a file, a one-line program, or the REPL.
layout: page
---

Metorex is built from source with Cargo.

## Requirements

- Rust 1.88 or newer. Metorex uses the 2024 edition and let chains.
- A C compiler on your `PATH` as `cc`, and `ar`. The build compiles the bundled Prism and nkf sources. Set `CC` to use a different compiler.
- Git.

## Build

```sh
$ git clone https://github.com/metorex-lang/metorex.git
$ cd metorex
$ cargo build --release
```

The binary is `target/release/metorex`.

## Run a File

Save this as `hello.rb`:

```ruby
puts "Hello, world!"
p [1, 2, 3].map { it * 2 }
```

Run it:

```sh
$ target/release/metorex hello.rb
Hello, world!
[2, 4, 6]
```

Arguments after the file name are passed to the program in `ARGV`.

## Run a One-Line Program

```sh
$ target/release/metorex -e 'puts 6 * 7'
42
```

## Start the REPL

```sh
$ target/release/metorex
```

```ruby
>> [1, 2].sum
=> 3
>> exit
```

`help` lists the REPL's commands, and Ctrl+D also exits.

## Run Tests

`metorex test` runs the files under `test/` whose names match `*_test.rb`, `test_*.rb`, or `*_spec.rb`, and `metorex test DIR` runs those under DIR. `metorex spec` runs an RSpec suite under `spec/` with [Rex](/docs/rex).

```sh
$ target/release/metorex test
$ target/release/metorex spec
```

## Every Option

```sh
$ target/release/metorex --help
```
