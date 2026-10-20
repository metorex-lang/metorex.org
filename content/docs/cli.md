---
title: Command Line
slug: cli
description: The metorex command, its spec subcommand, and every flag it takes, with the Ruby switches it reads the way MRI does.
order: 3
aliases: [/cli]
---

`metorex` runs a Ruby program: a file, code given with `-e`, or a program piped to standard input. With none of those and a terminal attached, it starts the REPL. The examples below are files under `tests/_examples/cli_flags` in the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, run from that directory, and the test suite checks each output.

## metorex --help

```
The Metorex programming language

Usage: metorex [OPTIONS] [FILE]...

Arguments:
  [FILE]...  Source file to execute, followed by arguments for the script

Options:
      --ast          Dump the AST instead of executing
      --debug        Enable debug/verbose output
      --repl         Start the REPL
      --test <TEST>  Discover and run test files in a directory (matches *_test.rb, test_*.rb, *_spec.rb)
  -v, --verbose      Print Ruby-compatible version string
  -e <EXECUTE>       Evaluate code from command line, once per `-e` written
  -h, --help         Print help
  -V, --version      Print version
```

The words after the file name go to the program in `ARGV`.

## metorex spec

`metorex spec` runs a spec suite with [Rex](/docs/rex), the spec framework built into Metorex. It takes RSpec's options, which `metorex spec --help` lists, and Rex's own.

```sh
metorex spec
metorex spec spec/ledger_spec.rb:14 --format documentation
```

## Versions

`-v` prints the description `RUBY_DESCRIPTION` holds, and turns on `$VERBOSE` for a program run alongside it. `-V` prints the version of the metorex binary.

```
$ metorex -v
metorex 4.0.6 (ruby-compatible) [arm64-darwin]
$ metorex -V
metorex 0.1.0
```

## Ruby's switches

`metorex --help` leaves these out, and each one does what it does for `ruby`.

| Switch | What it does |
| :-- | :-- |
| `-e CODE` | Runs CODE. Several are joined as lines of one program. |
| `-c` | Checks the syntax and prints `Syntax OK`, without running anything. |
| `-I DIR` | Puts DIR at the front of `$LOAD_PATH`. |
| `-r LIBRARY` | Requires LIBRARY before the program runs. |
| `-n` | Runs the program once for each input line, with the line in `$_`. |
| `-p` | Runs the `-n` loop and prints `$_` after each pass. |
| `-l` | Chomps each line the loop reads, and sets `$\` to `$/`. |
| `-a` | Splits each line the loop reads into `$F`. |
| `-F PATTERN` | The pattern `-a` splits on. |
| `-0 OCTAL` | The line separator `$/`, as an octal character code. |
| `-i[EXTENSION]` | Edits the files `ARGF` reads in place, keeping a backup under EXTENSION when one is given. |
| `-s` | Turns switches written after the file name into globals. |
| `-x` | Skips the text before the line that starts `#!` and names ruby. |
| `-S` | Looks the script up in `RUBYPATH`, then `PATH`. |
| `-C DIR`, `-X DIR` | Changes to DIR before running. |
| `-d` | Sets `$DEBUG`, and `$VERBOSE` with it. |
| `-w` | Sets `$VERBOSE` to true. |
| `-W[LEVEL]`, `-W:CATEGORY` | Sets the warning level, 0 to 2, or turns a category such as `deprecated` on, or off as `no-deprecated`. |
| `-E EXT:INT`, `--encoding` | The default external and internal encodings. |
| `--external-encoding`, `--internal-encoding` | Each of those on its own. |
| `-K CODE` | The encoding of the main script's literals, when it has no magic comment: `e` for EUC-JP, `s` for Windows-31J, `u` for UTF-8, `n` for ASCII-8BIT. |
| `-U` | Sets the default internal encoding to UTF-8. |
| `--backtrace-limit=N` | Writes at most N frames of an error's backtrace. |
| `--enable=FEATURE`, `--disable=FEATURE` | Turns a feature on or off. `--enable-FEATURE` is the same. |
| `--debug-frozen-string-literal` | A frozen literal remembers where it was written, and the error from changing it names that place. |

`RUBYOPT` is read as words written ahead of the command line, and it allows the switches MRI allows there.

## Features

`--enable` and `--disable` take `gems` (or `gem`), `error_highlight`, `did_you_mean`, `syntax_suggest`, `rubyopt`, `frozen_string_literal`, and `all`, several at once separated by commas. A hyphen reads as an underscore, so `frozen-string-literal` is the same name.

`show_features.rb`:

```metorex
# What `--enable` and `--disable` left behind, and how loud the run is.
puts defined?(Gem).inspect
puts defined?(DidYouMean).inspect
puts $VERBOSE.inspect
puts "frozen #{"literal".frozen?}"
```

```
$ metorex --disable-gems show_features.rb
nil
"constant"
false
frozen false
```

[Differences from MRI](/docs/ruby-differences#libraries-loaded-at-startup) says why `DidYouMean` is still there.

`frozen_literal_flags.rb`:

```metorex
held = "shared"
puts "frozen #{held.frozen?}"
puts "shared #{"shared".equal?("shared")}"
```

```
$ metorex --enable=frozen-string-literal frozen_literal_flags.rb
frozen true
shared true
```

`frozen_literal_birthplace.rb`:

```metorex
held = 'written here'
begin
  held << ' and more'
rescue FrozenError => refused
  puts refused.message
end
```

```
$ metorex --enable-frozen-string-literal --debug-frozen-string-literal frozen_literal_birthplace.rb
can't modify frozen String: "written here", created at frozen_literal_birthplace.rb:3
```

## Loading libraries

`lib/greet.rb` defines `greet`, and `use_greet.rb` requires it:

```metorex
require "greet"
greet("world")
```

```
$ metorex -I lib use_greet.rb
hello world
```

## Switches as globals

`switch_globals.rb`:

```metorex
p $flag
p $name
p $_long__name
p ARGV
```

```
$ metorex -s switch_globals.rb -flag -name=ada --long--name=held rest
true
"ada"
"held"
["rest"]
```

## Reading lines

Under `-n`, `Kernel` answers `chomp`, `chop`, `sub`, and `gsub`. `line_loop_methods.rb`:

```metorex
print(Kernel.public_methods(false).include?(:chomp), " ")
print(Kernel.private_instance_methods(false).include?(:sub), "\n")
```

```
$ printf 'one\ntwo\n' | metorex -n line_loop_methods.rb
true true
true true
```

## Encodings

`show_encodings.rb`:

```metorex
internal = Encoding.default_internal
puts("source #{__ENCODING__.name}")
puts("external #{Encoding.default_external.name}")
puts("internal #{internal.nil? ? "none" : internal.name}")
```

```
$ metorex -E ISO-8859-1:UTF-8 show_encodings.rb
source UTF-8
external ISO-8859-1
internal UTF-8
```

`source_encoding.rb`:

```metorex
p "a".encoding
p __ENCODING__
```

```
$ metorex -Ke source_encoding.rb
#<Encoding:EUC-JP>
#<Encoding:EUC-JP>
```

## Checking and debugging

```
$ metorex -c good_syntax.rb
Syntax OK
```

`show_debug.rb`:

```metorex
puts("$DEBUG #{$DEBUG}")
puts("$VERBOSE #{$VERBOSE}")
puts("$-d #{$-d}")
```

```
$ metorex -d show_debug.rb
$DEBUG true
$VERBOSE true
$-d true
```

`--ast` prints the syntax tree Metorex compiles, for a file or for `-e` code, and runs nothing. `--debug`, given a file, writes the file's path, its length in bytes, and its counts of tokens and statements to standard error before running it.

## Metorex's own options

- `--repl` starts the REPL even when a file is named.
- `--test DIR` finds the files under DIR named `*_test.rb`, `test_*.rb`, or `*_spec.rb`, runs each, and exits with status 1 when one fails.
