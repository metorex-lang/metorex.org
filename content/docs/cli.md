---
title: Command Line
slug: cli
description: The metorex command, its spec subcommand, and every flag it takes, with the Ruby switches it reads the way MRI does.
order: 3
aliases: [/cli]
---

`metorex` runs a Ruby program: a file, code given with `-e`, or a program piped to standard input. With none of those and a terminal attached, it starts the REPL.

## metorex --help

```
The Metorex programming language

Usage: metorex [OPTIONS] [FILE]...

Arguments:
  [FILE]...  Source file to execute, followed by arguments for the script

Options:
      --ast      Dump the AST instead of executing
      --debug    Enable debug/verbose output
  -v, --verbose  Print Ruby-compatible version string
  -e <EXECUTE>   Evaluate code from command line, once per `-e` written
  -h, --help     Print help
  -V, --version  Print version

Commands:
  spec [PATHS]   Run spec files with Rex (default: spec/)
  test [DIR]     Run the *_test.rb, test_*.rb, and *_spec.rb files under DIR (default: test/)
  repl           Start the REPL
  help           Print this help
  version        Print the metorex version
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
metorex 4.0.7 (ruby-compatible) [arm64-darwin]
$ metorex -V
metorex 0.1.0
```

## Ruby's Switches

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

`RUBYOPT` is read as words written ahead of the command line. It allows `-d`, `-E`, `-I`, `-K`, `-r`, `-T`, `-U`, `-v`, `-w`, `-W`, `--debug`, `--enable`, `--disable`, `--external-encoding`, `--internal-encoding`, `--verbose`, and `--backtrace-limit`, and any other switch there stops the run.

## Features

`--enable` and `--disable` take `gems` (or `gem`), `error_highlight`, `did_you_mean`, `syntax_suggest`, `rubyopt`, `frozen_string_literal`, and `all`, several at once separated by commas. A hyphen reads as an underscore, so `frozen-string-literal` is the same name.

`show_features.rb`:

```ruby
# What `--enable` and `--disable` left behind,
# and how loud the run is.
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

```ruby
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

```ruby
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

## Loading Libraries

`lib/greet.rb` defines `greet`, and `use_greet.rb` requires it:

```ruby
require "greet"
greet("world")
```

```
$ metorex -I lib use_greet.rb
hello world
```

## Switches as Globals

`switch_globals.rb`:

```ruby
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

## Reading Lines

Under `-n`, `Kernel` answers `chomp`, `chop`, `sub`, and `gsub`. `line_loop_methods.rb`:

```ruby
functions = Kernel.public_methods(false)
carried = Kernel.private_instance_methods(false)
print(functions.include?(:chomp), " ")
print(carried.include?(:sub), "\n")
```

```
$ printf 'one\ntwo\n' | metorex -n line_loop_methods.rb
true true
true true
```

## Encodings

`show_encodings.rb`:

```ruby
internal = Encoding.default_internal
internal_name = internal.nil? ? "none" : internal.name
puts("source #{__ENCODING__.name}")
puts("external #{Encoding.default_external.name}")
puts("internal #{internal_name}")
```

```
$ metorex -E ISO-8859-1:UTF-8 show_encodings.rb
source UTF-8
external ISO-8859-1
internal UTF-8
```

`source_encoding.rb`:

```ruby
p "a".encoding
p __ENCODING__
```

```
$ metorex -Ke source_encoding.rb
#<Encoding:EUC-JP>
#<Encoding:EUC-JP>
```

## Checking and Debugging

```
$ metorex -c good_syntax.rb
Syntax OK
```

`show_debug.rb`:

```ruby
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

## Metorex's Own Commands

- `metorex repl` starts the REPL. `metorex` with no file named and a terminal attached starts it too.
- `metorex test [DIR]` finds the files under DIR, or under `test/` when none is named, whose names match `*_test.rb`, `test_*.rb`, or `*_spec.rb`, runs each, and exits with status 1 when one fails.
- `metorex help` prints the help above, and `metorex version` prints the version `-V` prints.
- A file named `help`, `version`, `repl`, `test`, or `spec` in the current directory runs as a script instead, as `ruby help` would run it.
