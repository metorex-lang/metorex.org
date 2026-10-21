---
title: Architecture
slug: architecture
description: The path a Ruby program takes through Metorex, from source text to tokens, a syntax tree, bytecode, and the interpreter that runs it, with the module in src/ behind each stage.
layout: page
---

Metorex reads a program in four stages: a lexer turns the text into tokens, a parser turns the tokens into a syntax tree, a compiler turns each method, block, class body, and file of the tree into bytecode the first time it runs, and an interpreter runs those instructions. A unit that runs often is compiled again, to machine code. Each path below is in the `src/` directory of the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}.

<figure class="arch-diagram">
<svg class="arch-wide" viewBox="0 0 760 624" role="img" aria-labelledby="arch-diagram-title arch-diagram-desc">
<title id="arch-diagram-title">How Metorex runs a program</title>
<desc id="arch-diagram-desc">Source text goes from the command line to the lexer, the parser, the compiler, and the interpreter. The parser asks Prism whether MRI would refuse the program, and code as objects hands the syntax tree to the program. The interpreter runs hot units through the JIT and takes them back when an assumption breaks. It calls on method calls, core methods, values, and loading, and loading sends required files back to the lexer.</desc>
<defs>
<marker id="arch-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse"><path class="arch-arrowhead" d="M 0 0 L 10 5 L 0 10 z"/></marker>
</defs>
<g class="arch-edges">
<line x1="340" y1="84" x2="340" y2="118" marker-end="url(#arch-arrow)"/>
<line x1="340" y1="184" x2="340" y2="218" marker-end="url(#arch-arrow)"/>
<line x1="460" y1="252" x2="498" y2="252" marker-end="url(#arch-arrow)"/>
<line x1="340" y1="284" x2="340" y2="318" marker-end="url(#arch-arrow)"/>
<polyline points="250,284 250,302 110,302 110,318" marker-end="url(#arch-arrow)"/>
<line x1="340" y1="384" x2="340" y2="418" marker-end="url(#arch-arrow)"/>
<line x1="460" y1="440" x2="538" y2="440" marker-end="url(#arch-arrow)"/>
<line x1="540" y1="478" x2="462" y2="478" marker-end="url(#arch-arrow)"/>
<polyline points="340,500 340,516 95,516 95,538" marker-end="url(#arch-arrow)"/>
<polyline points="285,516 285,538" marker-end="url(#arch-arrow)"/>
<polyline points="475,516 475,538" marker-end="url(#arch-arrow)"/>
<polyline points="340,516 665,516 665,538" marker-end="url(#arch-arrow)"/>
<polyline class="arch-loop" points="24,540 24,152 218,152" marker-end="url(#arch-arrow)"/>
</g>
<g class="arch-labels">
<text x="350" y="106">source text</text>
<text x="350" y="206">tokens</text>
<text x="350" y="306">syntax tree</text>
<text x="350" y="406">units, compiled on first run</text>
<text x="467" y="432">hot units</text>
<text x="467" y="494">deoptimize</text>
<text x="34" y="144">required files</text>
</g>
<g class="arch-node"><rect x="220" y="20" width="240" height="64" rx="8"/><text x="340" y="46" class="arch-title">Starting a run</text><text x="340" y="66" class="arch-detail">main.rs · bin_support · repl.rs</text></g>
<g class="arch-node"><rect x="220" y="120" width="240" height="64" rx="8"/><text x="340" y="146" class="arch-title">Lexer</text><text x="340" y="166" class="arch-detail">src/lexer</text></g>
<g class="arch-node"><rect x="220" y="220" width="240" height="64" rx="8"/><text x="340" y="246" class="arch-title">Parser</text><text x="340" y="266" class="arch-detail">src/parser → src/ast</text></g>
<g class="arch-node"><rect x="500" y="220" width="240" height="64" rx="8"/><text x="620" y="246" class="arch-title">Prism syntax check</text><text x="620" y="266" class="arch-detail">vendor/prism · prism_parsing.rs</text></g>
<g class="arch-node"><rect x="40" y="320" width="160" height="72" rx="8"/><text x="120" y="344" class="arch-title">Code as objects</text><text x="120" y="363" class="arch-detail">ast_methods.rs</text><text x="120" y="380" class="arch-detail">Method#body, parse</text></g>
<g class="arch-node"><rect x="220" y="320" width="240" height="64" rx="8"/><text x="340" y="346" class="arch-title">Compiler</text><text x="340" y="366" class="arch-detail">src/bytecode · src/vm/units.rs</text></g>
<g class="arch-node arch-central"><rect x="220" y="420" width="240" height="80" rx="8"/><text x="340" y="446" class="arch-title">Interpreter</text><text x="340" y="466" class="arch-detail">VirtualMachine, src/vm/core.rs</text><text x="340" y="484" class="arch-detail">bytecode_runner.rs</text></g>
<g class="arch-node"><rect x="540" y="420" width="200" height="80" rx="8"/><text x="640" y="446" class="arch-title">JIT</text><text x="640" y="466" class="arch-detail">src/vm/jit</text><text x="640" y="484" class="arch-detail">arm64 and x86-64 code</text></g>
<g class="arch-node"><rect x="10" y="540" width="170" height="72" rx="8"/><text x="95" y="564" class="arch-title">Loading</text><text x="95" y="583" class="arch-detail">src/vm/loading</text><text x="95" y="600" class="arch-detail">stdlib · capi</text></g>
<g class="arch-node"><rect x="200" y="540" width="170" height="72" rx="8"/><text x="285" y="564" class="arch-title">Method calls</text><text x="285" y="583" class="arch-detail">method_lookup.rs</text><text x="285" y="600" class="arch-detail">method_invocation.rs</text></g>
<g class="arch-node"><rect x="390" y="540" width="170" height="72" rx="8"/><text x="475" y="564" class="arch-title">Core methods</text><text x="475" y="583" class="arch-detail">native_methods, Rust</text><text x="475" y="600" class="arch-detail">prelude, Ruby</text></g>
<g class="arch-node"><rect x="580" y="540" width="170" height="72" rx="8"/><text x="665" y="564" class="arch-title">Values</text><text x="665" y="583" class="arch-detail">src/object</text><text x="665" y="600" class="arch-detail">src/class</text></g>
</svg>
<svg class="arch-narrow" viewBox="0 0 340 810" role="img" aria-labelledby="arch-narrow-title arch-diagram-desc">
<title id="arch-narrow-title">How Metorex runs a program</title>
<defs>
<marker id="arch-arrow-narrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse"><path class="arch-arrowhead" d="M 0 0 L 10 5 L 0 10 z"/></marker>
</defs>
<g class="arch-edges">
<line x1="175" y1="66" x2="175" y2="90" marker-end="url(#arch-arrow-narrow)"/>
<line x1="175" y1="148" x2="175" y2="172" marker-end="url(#arch-arrow-narrow)"/>
<line x1="98" y1="230" x2="98" y2="260" marker-end="url(#arch-arrow-narrow)"/>
<line x1="252" y1="230" x2="252" y2="260" marker-end="url(#arch-arrow-narrow)"/>
<line x1="175" y1="230" x2="175" y2="354" marker-end="url(#arch-arrow-narrow)"/>
<line x1="175" y1="412" x2="175" y2="436" marker-end="url(#arch-arrow-narrow)"/>
<line x1="120" y1="510" x2="120" y2="538" marker-end="url(#arch-arrow-narrow)"/>
<line x1="230" y1="540" x2="230" y2="512" marker-end="url(#arch-arrow-narrow)"/>
<polyline points="320,474 332,474 332,616 175,616 175,624" marker-end="url(#arch-arrow-narrow)"/>
<polyline class="arch-loop" points="30,672 12,672 12,120 28,120" marker-end="url(#arch-arrow-narrow)"/>
</g>
<g class="arch-labels">
<text x="183" y="82">source text</text>
<text x="183" y="164">tokens</text>
<text x="183" y="348">syntax tree</text>
<text x="183" y="428">units, on first run</text>
<text x="128" y="530">hot units</text>
<text x="238" y="530">deoptimize</text>
<text x="0" y="0" transform="translate(8 470) rotate(-90)">required files</text>
</g>
<g class="arch-node"><rect x="30" y="10" width="290" height="56" rx="8"/><text x="175" y="34" class="arch-title">Starting a run</text><text x="175" y="53" class="arch-detail">main.rs · bin_support · repl.rs</text></g>
<g class="arch-node"><rect x="30" y="92" width="290" height="56" rx="8"/><text x="175" y="116" class="arch-title">Lexer</text><text x="175" y="135" class="arch-detail">src/lexer</text></g>
<g class="arch-node"><rect x="30" y="174" width="290" height="56" rx="8"/><text x="175" y="198" class="arch-title">Parser</text><text x="175" y="217" class="arch-detail">src/parser → src/ast</text></g>
<g class="arch-node"><rect x="30" y="262" width="136" height="70" rx="8"/><text x="98" y="286" class="arch-title">Prism check</text><text x="98" y="305" class="arch-detail">vendor/prism</text><text x="98" y="322" class="arch-detail">prism_parsing.rs</text></g>
<g class="arch-node"><rect x="184" y="262" width="136" height="70" rx="8"/><text x="252" y="286" class="arch-title">Code as objects</text><text x="252" y="305" class="arch-detail">ast_methods.rs</text><text x="252" y="322" class="arch-detail">Method#body, parse</text></g>
<g class="arch-node"><rect x="30" y="356" width="290" height="56" rx="8"/><text x="175" y="380" class="arch-title">Compiler</text><text x="175" y="399" class="arch-detail">src/bytecode · src/vm/units.rs</text></g>
<g class="arch-node arch-central"><rect x="30" y="438" width="290" height="72" rx="8"/><text x="175" y="462" class="arch-title">Interpreter</text><text x="175" y="481" class="arch-detail">VirtualMachine, src/vm/core.rs</text><text x="175" y="498" class="arch-detail">bytecode_runner.rs</text></g>
<g class="arch-node"><rect x="30" y="540" width="290" height="56" rx="8"/><text x="175" y="564" class="arch-title">JIT</text><text x="175" y="583" class="arch-detail">src/vm/jit · arm64 and x86-64</text></g>
<rect class="arch-group" x="24" y="626" width="302" height="172" rx="10"/>
<g class="arch-node"><rect x="30" y="636" width="142" height="72" rx="8"/><text x="101" y="660" class="arch-title">Loading</text><text x="101" y="679" class="arch-detail">src/vm/loading</text><text x="101" y="696" class="arch-detail">stdlib · capi</text></g>
<g class="arch-node"><rect x="178" y="636" width="142" height="72" rx="8"/><text x="249" y="660" class="arch-title">Method calls</text><text x="249" y="679" class="arch-detail">method_lookup.rs</text><text x="249" y="696" class="arch-detail">method_invocation.rs</text></g>
<g class="arch-node"><rect x="30" y="716" width="142" height="72" rx="8"/><text x="101" y="740" class="arch-title">Core methods</text><text x="101" y="759" class="arch-detail">native_methods</text><text x="101" y="776" class="arch-detail">prelude</text></g>
<g class="arch-node"><rect x="178" y="716" width="142" height="72" rx="8"/><text x="249" y="740" class="arch-title">Values</text><text x="249" y="759" class="arch-detail">src/object</text><text x="249" y="776" class="arch-detail">src/class</text></g>
</svg>
</figure>

## Starting a Run

`src/main.rs` reads the command line with the `Cli` struct in `src/bin_support/options.rs`, folds in `RUBYOPT`, and picks what runs: `metorex spec`, the subcommands in `src/bin_support/subcommands.rs`, a file, `-e` code, standard input, or the REPL in `src/repl.rs`. `src/bin_support/startup.rs` applies the flags to the interpreter before the program runs.

## Lexing

`src/lexer` turns source text into tokens, split into files by the kind of token they read: `identifiers.rs` for names and keywords, `numbers.rs`, `strings.rs` for quoted strings and interpolation, `heredoc.rs`, `regex_lit.rs`, and `percent.rs` for `%w`, `%r`, and the other percent literals. `dispatch.rs` picks among them by the next character. The token types are in `token.rs`.

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

`src/vm/jit` compiles a unit that has run often enough to machine code for arm64 or x86-64. The machine code calls the interpreter's `step` for each instruction, except these, which it runs itself: jumps, integer arithmetic and comparisons while their operands have only been Integers, instance variable reads and writes, and calls to the method a call site found before. It checks its assumptions as it goes, and when one breaks (a method defined or removed, a constant set, a TracePoint enabled, a `binding` taken) it hands the run back to `bytecode_runner.rs` at the current instruction. `METOREX_JIT=0` turns it off.

Values are the 8-byte `Object` struct in `src/object/types.rs`, laid out as MRI's C `VALUE` is. Integers that fit in 63 bits, most Floats, `true`, `false`, `nil`, and Symbols are held in the word itself, and any other value is a pointer to a reference-counted body. An object is freed when the last reference to it goes, and `src/object/collector.rs` frees groups of objects that refer only to each other. Classes and their method tables are in `src/class`.

## Loading Code

`src/vm/loading` handles `require`, `load`, and `autoload`. The libraries Metorex ships are held in the binary under `src/vm/stdlib`, so `require` finds them without a directory on the load path. `src/vm/capi` exports MRI's C API from the binary and loads C extensions built against it, as [C extensions](/docs/c-extensions) shows.

## Code as Objects

The syntax tree the compiler reads is the one a program reads with [code as objects](/docs/meta). `src/vm/native_methods/ast_methods.rs` turns tree nodes into hashes, and `Method#body` and `parse` return them. The nodes a program reads are the ones its instructions were compiled from.
