---
title: "stdlib/console_pp_and_pathname.rb"
slug: stdlib-console-pp-and-pathname
description: "The metorex example program stdlib/console_pp_and_pathname.rb and its output."
---

`tests/_examples/stdlib/console_pp_and_pathname.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/console_pp_and_pathname.rb).

```metorex
require("io/console")
require("pty")
require("stringio")

PTY.open do |primary, terminal|
  terminal.winsize = [30, 100]
  p(terminal.winsize)
  p(terminal.echo?)
  terminal.echo = false
  p(terminal.echo?)
  terminal.echo = true
  p(terminal.raw { |raw| raw.echo? })
  mode = terminal.console_mode
  terminal.console_mode = mode.raw(min: 2, time: 0.5)
  p(terminal.echo?)
  terminal.console_mode = mode
  p(terminal.noecho { terminal.echo? })
  p(terminal.echo?)
  # The key is typed with echo off, since whether the terminal echoes it
  # depends on whether `getch` turns raw mode on before the key is read.
  terminal.echo = false
  primary.write("q")
  p(terminal.getch)
  terminal.echo = true
  terminal.goto(2, 4)
  terminal.erase_line(0)
  terminal.cursor_up(1)
  # What the terminal was sent arrives in its own time, so it is read
  # until the last of it is there.
  shown = +""
  shown << primary.readpartial(100) until shown.end_with?("\e[1A")
  p(shown)
  p((terminal.erase_screen(9) rescue $!))
  p(terminal.ttyname.start_with?("/dev/"))
end

File.open(File::NULL) do |null|
  p((null.winsize rescue $!.is_a?(SystemCallError)))
  p(null.ttyname)
end

input = StringIO.new("s3cret\n")
p(input.getpass("Password: "))
p(input.string)

order = {id: 1042, lines: (1..12).map { |line| {sku: "SKU-#{line}", quantity: line} }}
pp(order)
puts(order.pretty_inspect.lines.size)

p(defined?(Pathname))
p(Pathname("/var/log/app.log").basename)
p(Pathname("/var/log").join("app.log").to_s)
p(Pathname("logs/../app.log").cleanpath)
p(Pathname("a") <=> Pathname("b"))
p(Pathname.instance_method(:writable?).source_location.first)
p(require("pathname"))
p(Pathname("/var/log").respond_to?(:find))
```

Output:

```
[30, 100]
true
false
false
false
false
true
"q"
"\e[3;5H\e[0K\e[1A"
#<ArgumentError: wrong screen erase mode: 9>
true
true
nil
nil
"Password: \n"
{id: 1042,
 lines:
  [{sku: "SKU-1", quantity: 1},
   {sku: "SKU-2", quantity: 2},
   {sku: "SKU-3", quantity: 3},
   {sku: "SKU-4", quantity: 4},
   {sku: "SKU-5", quantity: 5},
   {sku: "SKU-6", quantity: 6},
   {sku: "SKU-7", quantity: 7},
   {sku: "SKU-8", quantity: 8},
   {sku: "SKU-9", quantity: 9},
   {sku: "SKU-10", quantity: 10},
   {sku: "SKU-11", quantity: 11},
   {sku: "SKU-12", quantity: 12}]}
14
"constant"
#<Pathname:app.log>
"/var/log/app.log"
#<Pathname:app.log>
-1
"<internal:pathname_builtin>"
true
true
```
