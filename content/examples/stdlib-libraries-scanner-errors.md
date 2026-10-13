---
title: "stdlib_libraries/scanner_errors.rb"
slug: stdlib-libraries-scanner-errors
description: "The metorex example program stdlib_libraries/scanner_errors.rb and its output."
---

`tests/_examples/stdlib_libraries/scanner_errors.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/scanner_errors.rb).

```metorex
# The scanner reports an escape or a number MRI's lexer refuses and reads
# on past it, as MRI's lexer does, so a later syntax error is reported too.
# Each error comes through the Ripper event MRI uses, and
# RubyVM::AbstractSyntaxTree.parse quotes the place each one names.
require "ripper"

class ScannerErrors < Ripper
  attr_reader :seen

  def initialize(*)
    super
    @seen = []
  end

  def on_parse_error(message)
    @seen << "parse_error: #{message}"
  end

  def compile_error(message)
    @seen << "compile_error: #{message}"
  end
end

SOURCES = [
  "\"\\xg\"",
  "\"\\u{zz}\"",
  "\"\\u{61\"",
  "\"\\u12\"",
  "x = 0x + 1",
  "0xg",
  "0b2",
  "@1",
  "@@1a",
  "$-",
  "?\\xg",
  "%(\\xg)",
  "/\\xg/",
  "'\\xg'"
].freeze

SOURCES.each do |source|
  puts(source.inspect)
  errors = ScannerErrors.new(source)
  errors.parse
  errors.seen.each { |line| puts("  #{line}") }
  begin
    RubyVM::AbstractSyntaxTree.parse(source)
  rescue SyntaxError => error
    error.message.each_line { |line| puts("  | #{line.chomp}") }
  end
end

p(Ripper.lex("\"a\\u{zz}b\"").map { |(_, event, text)| [event, text] })
p(Ripper.lex("@1").map { |(_, event, text)| [event, text] })
```

Output:

```
"\"\\xg\""
  parse_error: invalid hex escape
  | invalid hex escape
  | "\xg"
  |  ^~
"\"\\u{zz}\""
  parse_error: invalid Unicode escape
  parse_error: unterminated Unicode escape
  | invalid Unicode escape
  | "\u{zz}"
  |     ^
  | unterminated Unicode escape
  | "\u{zz}"
  |     ^
"\"\\u{61\""
  parse_error: unterminated Unicode escape
  | unterminated Unicode escape
  | "\u{61"
  |       ^
"\"\\u12\""
  parse_error: invalid Unicode escape
  | invalid Unicode escape
  | "\u12"
  |  ^~~~
"x = 0x + 1"
  parse_error: numeric literal without digits
  | numeric literal without digits
  | x = 0x + 1
  |     ^~
"0xg"
  parse_error: numeric literal without digits
  parse_error: syntax error, unexpected local variable or method, expecting end-of-input
  | numeric literal without digits
  | syntax error, unexpected local variable or method, expecting end-of-input
"0b2"
  parse_error: numeric literal without digits
  parse_error: syntax error, unexpected integer literal, expecting end-of-input
  | numeric literal without digits
  | syntax error, unexpected integer literal, expecting end-of-input
"@1"
  compile_error: '@1' is not allowed as an instance variable name
  parse_error: syntax error, unexpected integer literal, expecting end-of-input
  | '@1' is not allowed as an instance variable name
  | syntax error, unexpected integer literal, expecting end-of-input
"@@1a"
  compile_error: '@@1' is not allowed as a class variable name
  parse_error: syntax error, unexpected integer literal, expecting end-of-input
  | '@@1' is not allowed as a class variable name
  | syntax error, unexpected integer literal, expecting end-of-input
"$-"
  parse_error: syntax error, unexpected invalid token
  | syntax error, unexpected invalid token
"?\\xg"
  parse_error: invalid hex escape
  parse_error: syntax error, unexpected local variable or method, expecting end-of-input
  | invalid hex escape
  | syntax error, unexpected local variable or method, expecting end-of-input
"%(\\xg)"
  parse_error: invalid hex escape
  | invalid hex escape
  | %(\xg)
  |   ^~
"/\\xg/"
  parse_error: invalid hex escape
  | invalid hex escape
  | /\xg/
  |  ^~
"'\\xg'"
[[:on_tstring_beg, "\""], [:on_tstring_content, "a\\u{"], [:on_tstring_content, "zz}b"], [:on_tstring_end, "\""]]
[[:on_ivar, "@"], [:on_int, "1"]]
```
