---
title: Architecture
slug: architecture
description: The path a Ruby program takes through Metorex, from source text to tokens, a syntax tree, and the interpreter that walks it, with the module in src/ behind each stage.
layout: page
---

Metorex reads a program in three stages: a lexer turns the text into tokens, a parser turns the tokens into a syntax tree, and an interpreter walks the tree and runs it. Nothing is compiled to instructions. Each path below is in the `src/` directory of the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}.

## Starting a run

`src/main.rs` reads the command line with the `Cli` struct in `src/bin_support/options.rs`, folds in `RUBYOPT`, and picks what runs: `metorex spec`, a file, `-e` code, standard input, `--test`, or the REPL in `src/repl.rs`. `src/bin_support/startup.rs` applies the flags to the interpreter before the program runs.

## Lexing

`src/lexer` turns source text into tokens. It is written by hand, one file per kind of token: `identifiers.rs` for names and keywords, `numbers.rs`, `strings.rs` for quoted strings and interpolation, `heredoc.rs`, `regex_lit.rs`, and `percent.rs` for `%w`, `%r`, and the other percent literals. `dispatch.rs` picks among them by the next character. The token types are in `token.rs`.

## Parsing

`src/parser` reads the tokens into the syntax tree defined in `src/ast`, with statements in `parser/statements` and expressions in `parser/expressions`. The tree's node types are in `src/ast/node`: `statements.rs`, `expressions.rs`, `parameters.rs`, and `patterns.rs` for pattern matching.

Prism, MRI's parser, is compiled into the binary from `vendor/prism` by `build.rs`. Before a program runs, `src/vm/native_functions/prism_parsing.rs` asks Prism whether MRI would refuse it, and when it would, the program does not run and the SyntaxError report is laid out the way MRI lays it out. The same functions back `require "prism"`.

## Running

The interpreter is the `VirtualMachine` struct in `src/vm/core.rs`. A new one registers the core classes and their methods through `src/vm/init`, and loads the core methods written in Ruby from `src/vm/prelude`.

- `src/vm/program.rs` runs a file's top level.
- `src/vm/statement` runs statements, and `src/vm/control_structures.rs`, `src/vm/begin_rescue.rs`, and `src/vm/pattern_matching` run the statements that branch, rescue, and match.
- `src/vm/eval` evaluates expressions. `eval/dispatch.rs` matches on the expression's type and calls the module for that type, such as `calls.rs`, `identifier.rs`, or `yield_expr.rs`.
- `src/vm/method_lookup.rs` finds the method a call names along the receiver's ancestors, and `src/vm/method_invocation.rs`, `src/vm/method_execution.rs`, and `src/vm/block_execution` run it.
- `src/vm/native_methods` holds the core methods written in Rust, and `src/vm/native_functions` the functions the Ruby-written parts call into, including the native versions of parts of Rex in `fast_paths.rs`.

Values are the `Object` enum in `src/object`. Small values such as integers, floats, and `nil` are held in the enum itself, and strings, arrays, hashes, and instances are reference counted, so each is freed when the last reference to it goes. Classes and their method tables are in `src/class`.

## Loading code

`src/vm/loading` handles `require`, `load`, and `autoload`. The libraries Metorex ships are held in the binary under `src/vm/stdlib`, so `require` finds them without a directory on the load path. `src/vm/capi` exports MRI's C API from the binary and loads C extensions built against it, as [C extensions](/c-extensions) shows.

## Code as objects

The syntax tree the interpreter runs is the one a program reads with [code as objects](/meta). `src/vm/native_methods/ast_methods.rs` turns tree nodes into hashes, and `Method#body` and `parse` return them. Since the interpreter runs the tree rather than instructions compiled from it, the nodes a program reads are the ones that run.
