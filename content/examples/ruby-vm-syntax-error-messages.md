---
title: "ruby_vm/syntax_error_messages.rb"
slug: ruby-vm-syntax-error-messages
description: "The metorex example program ruby_vm/syntax_error_messages.rb and its output."
---

`tests/_examples/ruby_vm/syntax_error_messages.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_error_messages.rb).

```metorex
# A program the parser refuses raises SyntaxError naming the token it met
# the way MRI's parser does, and listing the tokens it would have taken when
# there are at most four of them.
SOURCES = [
  "`a` `b`",
  "case a; in @b; end",
  "foo 1 { }",
  "1 +",
  "def f(; end",
  "x = = 1",
  "[1, 2",
  "p(1 2)",
  "class Foo < ; end",
  "foo(a: 1, 2)",
  "{a: 1 b: 2}",
  "1 2",
  "a ? b",
  "def f a, b c; end",
  "-> (x { x }",
  "module 1; end",
  "class foo; end",
  ":",
  "1..2..3",
  "x.y z w",
  "begin; rescue => 1; end",
  "case 1 when 2 then 3 else 4 else 5 end",
  "for in [1]; end",
  "%w(a b",
  "\"abc",
  "[1,,2]",
  "{1 => }",
  "a::B::",
  "-> { } ()",
  "a ||| b",
  "BEGIN 1",
  "def self.; end",
  "0x",
  "1_",
  "def f(*a, *b); end",
  "def f(**a, b); end",
  "x = <<~EOS",
  "when 1",
  "=>",
  "::",
  ";;;)"
].freeze

SOURCES.each do |source|
  RubyVM::AbstractSyntaxTree.parse(source)
  puts("#{source.inspect}: read")
rescue SyntaxError => error
  puts("#{source.inspect}: #{error.message.lines.first.chomp}")
end
```

Output:

```
"`a` `b`": syntax error, unexpected backtick literal, expecting end-of-input
"case a; in @b; end": syntax error, unexpected instance variable
"foo 1 { }": syntax error, unexpected '{', expecting end-of-input
"1 +": syntax error, unexpected end-of-input
"def f(; end": syntax error, unexpected ';', expecting ')'
"x = = 1": syntax error, unexpected '='
"[1, 2": syntax error, unexpected end-of-input, expecting ']'
"p(1 2)": syntax error, unexpected integer literal, expecting ')'
"class Foo < ; end": syntax error, unexpected ';'
"foo(a: 1, 2)": syntax error, unexpected ')', expecting =>
"{a: 1 b: 2}": syntax error, unexpected local variable or method, expecting '}'
"1 2": syntax error, unexpected integer literal, expecting end-of-input
"a ? b": syntax error, unexpected end-of-input, expecting ':'
"def f a, b c; end": syntax error, unexpected local variable or method, expecting '\n' or ';'
"-> (x { x }": syntax error, unexpected '{', expecting ')'
"module 1; end": syntax error, unexpected ';', expecting '.' or &. or :: or '['
"class foo; end": class/module name must be CONSTANT
":": syntax error, unexpected end-of-input, expecting literal content or terminator or '#{' or tSTRING_DVAR
"1..2..3": syntax error, unexpected ..
"x.y z w": read
"begin; rescue => 1; end": syntax error, unexpected ';', expecting '.' or &. or :: or '['
"case 1 when 2 then 3 else 4 else 5 end": syntax error, unexpected 'else', expecting 'end' or dummy end
"for in [1]; end": syntax error, unexpected 'in'
"%w(a b": unterminated list meets end of file
"\"abc": unterminated string meets end of file
"[1,,2]": syntax error, unexpected ',', expecting ']'
"{1 => }": syntax error, unexpected '}'
"a::B::": syntax error, unexpected end-of-input, expecting '('
"-> { } ()": syntax error, unexpected '(', expecting end-of-input
"a ||| b": syntax error, unexpected '|'
"BEGIN 1": syntax error, unexpected integer literal, expecting '{'
"def self.; end": syntax error, unexpected ';'
"0x": numeric literal without digits
"1_": trailing '_' in number
"def f(*a, *b); end": syntax error, unexpected *
"def f(**a, b); end": syntax error, unexpected local variable or method, expecting & or '&'
"x = <<~EOS": can't find string "EOS" anywhere before EOF
"when 1": syntax error, unexpected 'when'
"=>": syntax error, unexpected =>
"::": syntax error, unexpected end-of-input, expecting constant
";;;)": syntax error, unexpected ')'
```
