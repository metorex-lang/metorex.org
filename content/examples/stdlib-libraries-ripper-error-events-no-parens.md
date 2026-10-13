---
title: "stdlib_libraries/ripper_error_events_no_parens.rb"
slug: stdlib-libraries-ripper-error-events-no-parens
description: "The metorex example program stdlib_libraries/ripper_error_events_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/ripper_error_events_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/ripper_error_events_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Ripper reports each error through the event MRI's parser uses for it:
# `parse_error`, `assign_error`, `alias_error`, `class_name_error` or
# `compile_error`. RubyVM::AbstractSyntaxTree raises SyntaxError with every
# error's message, each with the line it names quoted beneath it.
require "ripper"

class ErrorEvents < Ripper
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

  %i[assign_error alias_error class_name_error].each do |event|
    define_method(:"on_#{event}") do |message, value|
      @seen << "#{event}: #{message}"
      value
    end
  end
end

SOURCES = [
  "class A; return; end",
  "def f; class A; end; end",
  "def f; module M; end; end",
  "def f; A = 1; end",
  "alias $a $1",
  "def f(a, a); end",
  "foo { |a, a| }",
  "->(a, a) {}",
  "def f(a:, a:); end",
  "case 1; in [x, x]; end",
  "case a; in x | 1; end",
  "case a; in 1 | x; end",
  "[1].each { _1; it }",
  "[1].each { it; _1 }",
  "[1].each { _1; [2].each { _1 } }",
  "_1 = 1",
  "self = 1",
  "$1 = 1",
  "class foo; end",
  "x = return",
  "next next",
  "def foo=() = 1",
  "def f; BEGIN {}; end",
  "x = 1; x = *",
  "\"abc",
  "0o8"
].freeze

SOURCES.each do |source|
  puts source.inspect
  events = ErrorEvents.new(source)
  events.parse
  events.seen.each { |line| puts "  #{line}" }
  begin
    RubyVM::AbstractSyntaxTree.parse source
  rescue SyntaxError => error
    error.message.each_line { |line| puts "  | #{line.chomp}" }
  end
end
```

Output:

```
"class A; return; end"
  parse_error: Invalid return in class/module body
  | Invalid return in class/module body
  | class A; return; end
  |          ^~~~~~
"def f; class A; end; end"
  parse_error: class definition in method body
  | class definition in method body
  | def f; class A; end; end
  |        ^~~~~~~
"def f; module M; end; end"
  parse_error: module definition in method body
  | module definition in method body
  | def f; module M; end; end
  |        ^~~~~~~~
"def f; A = 1; end"
  assign_error: dynamic constant assignment
  | dynamic constant assignment
  | def f; A = 1; end
  |        ^
"alias $a $1"
  alias_error: can't make alias for the number variables
  | can't make alias for the number variables
  | alias $a $1
  |          ^~
"def f(a, a); end"
  parse_error: duplicated argument name
  | duplicated argument name
  | def f(a, a); end
  |           ^
"foo { |a, a| }"
  parse_error: duplicated argument name
  | duplicated argument name
  | foo { |a, a| }
  |            ^
"->(a, a) {}"
  parse_error: duplicated argument name
  | duplicated argument name
  | ->(a, a) {}
  |        ^
"def f(a:, a:); end"
  parse_error: duplicated argument name
  | duplicated argument name
  | def f(a:, a:); end
  |             ^
"case 1; in [x, x]; end"
  parse_error: duplicated variable name
  | duplicated variable name
  | case 1; in [x, x]; end
  |                ^
"case a; in x | 1; end"
  parse_error: alternative pattern after variable capture
  | alternative pattern after variable capture
  | case a; in x | 1; end
  |              ^
"case a; in 1 | x; end"
  parse_error: variable capture in alternative pattern
  | variable capture in alternative pattern
  | case a; in 1 | x; end
  |                ^
"[1].each { _1; it }"
  compile_error: 'it' is not allowed when a numbered parameter is already used
(ripper):1: numbered parameter is already used here
  | 'it' is not allowed when a numbered parameter is already used
  | (none):1: numbered parameter is already used here
  | [1].each { _1; it }
  |            ^~
"[1].each { it; _1 }"
  compile_error: numbered parameters are not allowed when 'it' is already used
(ripper):1: 'it' is already used here
  | numbered parameters are not allowed when 'it' is already used
  | (none):1: 'it' is already used here
  | [1].each { it; _1 }
  |            ^~
"[1].each { _1; [2].each { _1 } }"
  compile_error: numbered parameter is already used in outer block
(ripper):1: numbered parameter is already used here
  | numbered parameter is already used in outer block
  | (none):1: numbered parameter is already used here
  | [1].each { _1; [2].each { _1 } }
  |            ^~
"_1 = 1"
  compile_error: _1 is reserved for numbered parameter
  | _1 is reserved for numbered parameter
"self = 1"
  assign_error: Can't change the value of self
  | Can't change the value of self
  | self = 1
  | ^~~~
"$1 = 1"
  assign_error: Can't set variable $1
  | Can't set variable $1
"class foo; end"
  class_name_error: class/module name must be CONSTANT
  | class/module name must be CONSTANT
  | class foo; end
  |       ^~~
"x = return"
  parse_error: void value expression
  | void value expression
  | x = return
  |     ^~~~~~
"next next"
  parse_error: void value expression
  parse_error: Invalid next
  parse_error: Invalid next
  | void value expression
  | next next
  |      ^~~~
  | Invalid next
  | next next
  |      ^~~~
  | Invalid next
  | next next
  | ^~~~~~~~~
"def foo=() = 1"
  parse_error: setter method cannot be defined in an endless method definition
  | setter method cannot be defined in an endless method definition
  | def foo=() = 1
  | ^~~~~~~~
"def f; BEGIN {}; end"
  parse_error: BEGIN is permitted only at toplevel
  | BEGIN is permitted only at toplevel
  | def f; BEGIN {}; end
  |        ^~~~~
"x = 1; x = *"
  compile_error: no anonymous rest parameter
  parse_error: syntax error, unexpected end-of-input, expecting ','
  | no anonymous rest parameter
  | syntax error, unexpected end-of-input, expecting ','
  | x = 1; x = *
  |             ^
"\"abc"
  compile_error: unterminated string meets end of file
  | unterminated string meets end of file
"0o8"
  parse_error: Invalid octal digit
  | Invalid octal digit
```
