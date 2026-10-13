---
title: "ARGF"
slug: argf
description: "The methods ruby/spec describes in core/argf, and which Metorex implements."
---

ruby/spec describes 36 methods in `core/argf`, and Metorex implements 36 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`ARGF.argv`**: implemented, parameters `[]`. Returns the `ARGV` array, which contains the arguments passed to your script, one per element.
- **`ARGF.binmode`**: implemented, parameters `[]`. Puts ARGF into binary mode.
- **`ARGF.close`**: implemented, parameters `[]`. Closes the current file and skips to the next file in ARGV.
- **`ARGF.closed?`**: implemented, parameters `[]`. Returns *true* if the current file has been closed; *false* otherwise.
- **`ARGF.each`**: implemented, parameters `[[:rest, :separator], [:block, :block]]`. Returns an enumerator which iterates over each line (separated by *sep*, which defaults to your platform's newline character) of each file in `ARGV`.
- **`ARGF.each_byte`**: implemented, parameters `[[:block, :block]]`. Iterates over each byte of each file in `ARGV`.
- **`ARGF.each_char`**: implemented, parameters `[[:block, :block]]`. Iterates over each character of each file in ARGF.
- **`ARGF.each_codepoint`**: implemented, parameters `[[:block, :block]]`. Iterates over each codepoint of each file in ARGF.
- **`ARGF.each_line`**: implemented, parameters `[[:rest, :separator], [:block, :block]]`. Returns an enumerator which iterates over each line (separated by *sep*, which defaults to your platform's newline character) of each file in `ARGV`.
- **`ARGF.eof`**: implemented, parameters `[]`. Returns true if the current file in ARGF is at end of file, i.e.
- **`ARGF.eof?`**: implemented, parameters `[]`. Returns true if the current file in ARGF is at end of file, i.e.
- **`ARGF.file`**: implemented, parameters `[]`. Returns the current file as an IO or File object.
- **`ARGF.filename`**: implemented, parameters `[]`. Returns the current filename.
- **`ARGF.fileno`**: implemented, parameters `[]`. Returns an integer representing the numeric file descriptor for the current file.
- **`ARGF.getc`**: implemented, parameters `[]`. Reads the next character from ARGF and returns it as a String.
- **`ARGF.gets`**: implemented, parameters `[[:rest, :separator], [:keyrest, :keywords]]`. Returns the next line from the current file in ARGF. [An example calling it](/examples/cli-flags-edit-in-place).
- **`ARGF.inspect`**: implemented, parameters `[]`. Returns "ARGF".
- **`ARGF.lineno`**: implemented, parameters `[]`. Returns the current line number of ARGF as a whole.
- **`ARGF.path`**: implemented, parameters `[]`. Returns the current filename.
- **`ARGF.pos`**: implemented, parameters `[]`. Returns the current offset (in bytes) of the current file in ARGF.
- **`ARGF.pos=`**: implemented, parameters `[[:req, :offset]]`. Seeks to the position given by *position* (in bytes) in ARGF.
- **`ARGF.read`**: implemented, parameters `[[:opt, :length], [:opt, :buffer]]`. Reads *length* bytes from ARGF.
- **`ARGF.read_nonblock`**: implemented, parameters `[[:opt, :length], [:opt, :buffer], [:key, :exception]]`. Reads at most *maxlen* bytes from the ARGF stream in non-blocking mode.
- **`ARGF.readchar`**: implemented, parameters `[]`. Reads the next character from ARGF and returns it as a String.
- **`ARGF.readline`**: implemented, parameters `[[:rest, :separator], [:keyrest, :keywords]]`. Returns the next line from the current file in ARGF.
- **`ARGF.readlines`**: implemented, parameters `[[:rest, :args], [:keyrest, :keywords]]`. Reads each file in ARGF in its entirety, returning an Array containing lines from the files.
- **`ARGF.readpartial`**: implemented, parameters `[[:opt, :length], [:opt, :buffer]]`. Reads at most *maxlen* bytes from the ARGF stream.
- **`ARGF.rewind`**: implemented, parameters `[]`. Positions the current file to the beginning of input, resetting ARGF.lineno to zero.
- **`ARGF.seek`**: implemented, parameters `[[:req, :offset], [:opt, :whence]]`. Seeks to offset *amount* (an Integer) in the ARGF stream according to the value of *whence*.
- **`ARGF.set_encoding`**: implemented, parameters `[[:req, :external], [:opt, :internal]]`. If single argument is specified, strings read from ARGF are tagged with the encoding specified.
- **`ARGF.skip`**: implemented, parameters `[]`. Sets the current file to the next file in ARGV.
- **`ARGF.tell`**: implemented, parameters `[]`. Returns the current offset (in bytes) of the current file in ARGF.
- **`ARGF.to_a`**: implemented, parameters `[[:rest, :args]]`. Reads each file in ARGF in its entirety, returning an Array containing lines from the files.
- **`ARGF.to_i`**: implemented, parameters `[]`. Returns an integer representing the numeric file descriptor for the current file.
- **`ARGF.to_io`**: implemented, parameters `[]`. Returns an IO object representing the current file.
- **`ARGF.to_s`**: implemented, parameters `[]`. Returns "ARGF".

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
