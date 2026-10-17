---
title: Architecture
slug: architecture
description: The path a Ruby program takes through Metorex, from source text to tokens, a syntax tree, bytecode, and the interpreter that runs it, with the module in src/ behind each stage.
layout: page
---

Metorex reads a program in four stages: a lexer turns the text into tokens, a parser turns the tokens into a syntax tree, a compiler turns each method, block, class body, and file of the tree into bytecode the first time it runs, and an interpreter runs those instructions. Each path below is in the `src/` directory of the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}.

## Starting a run

`src/main.rs` reads the command line with the `Cli` struct in `src/bin_support/options.rs`, folds in `RUBYOPT`, and picks what runs: `metorex spec`, a file, `-e` code, standard input, `--test`, or the REPL in `src/repl.rs`. `src/bin_support/startup.rs` applies the flags to the interpreter before the program runs.

## Lexing

`src/lexer` turns source text into tokens. It is written by hand, one file per kind of token: `identifiers.rs` for names and keywords, `numbers.rs`, `strings.rs` for quoted strings and interpolation, `heredoc.rs`, `regex_lit.rs`, and `percent.rs` for `%w`, `%r`, and the other percent literals. `dispatch.rs` picks among them by the next character. The token types are in `token.rs`.

## Parsing

`src/parser` reads the tokens into the syntax tree defined in `src/ast`, with statements in `parser/statements` and expressions in `parser/expressions`. The tree's node types are in `src/ast/node`: `statements.rs`, `expressions.rs`, `parameters.rs`, and `patterns.rs` for pattern matching.

Prism, MRI's parser, is compiled into the binary from `vendor/prism` by `build.rs`. Before a program runs, `src/vm/native_functions/prism_parsing.rs` asks Prism whether MRI would refuse it, and when it would, the program does not run and the SyntaxError report is laid out the way MRI lays it out. The same functions back `require "prism"`.

## Compiling

`src/bytecode/compiler.rs` compiles a body of the syntax tree to a unit, defined in `src/bytecode/unit.rs`: its instructions, the source position of each, and the tables of constants, names, locals, and call sites they name. The instructions, 4 bytes each, are the `Instruction` enum in `src/bytecode/instruction.rs`, and most of them name registers. `src/vm/units.rs` compiles a method, block, class or module body, or file the first time it runs and keeps the unit with it. Code handed to `eval` as a String is compiled each time it runs.

`METOREX_DISASM=1` writes each unit to standard error as it is compiled, and `RubyVM::InstructionSequence#disasm` lists the instructions of a program or method.

## Running

The interpreter is the `VirtualMachine` struct in `src/vm/core.rs`. A new one registers the core classes and their methods through `src/vm/init`, and loads the core methods written in Ruby from `src/vm/prelude`.

- `src/vm/bytecode_runner.rs` runs a unit: one loop that matches on each instruction over the unit's registers.
- `src/vm/program.rs` runs a file's top level, and `src/vm/class_execution` the statements of a class or module body.
- `src/vm/pattern_matching` matches a value against a pattern for `case`/`in` and `case`/`when`.
- `src/vm/method_lookup.rs` finds the method a call names along the receiver's ancestors, and `src/vm/method_invocation.rs`, `src/vm/method_execution.rs`, and `src/vm/block_execution` run it.
- `src/vm/native_methods` holds the core methods written in Rust, and `src/vm/native_functions` the functions the Ruby-written parts call into, including the native versions of parts of Rex in `fast_paths.rs`.

Values are the `Object` enum in `src/object`. Small values such as integers, floats, and `nil` are held in the enum itself, and strings, arrays, hashes, and instances are reference counted, so each is freed when the last reference to it goes. Classes and their method tables are in `src/class`.

## Loading code

`src/vm/loading` handles `require`, `load`, and `autoload`. The libraries Metorex ships are held in the binary under `src/vm/stdlib`, so `require` finds them without a directory on the load path. `src/vm/capi` exports MRI's C API from the binary and loads C extensions built against it, as [C extensions](/c-extensions) shows.

## Code as objects

The syntax tree the compiler reads is the one a program reads with [code as objects](/meta). `src/vm/native_methods/ast_methods.rs` turns tree nodes into hashes, and `Method#body` and `parse` return them. The nodes a program reads are the ones its instructions were compiled from.
