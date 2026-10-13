---
title: "stdlib_libraries/ripper_events_no_parens.rb"
slug: stdlib-libraries-ripper-events-no-parens
description: "The metorex example program stdlib_libraries/ripper_events_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/ripper_events_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/ripper_events_no_parens.rb).

```metorex
require 'ripper'

source = "def area(width, height = 2) = width * height\nputs area(3)\n"

p Ripper.tokenize(source)
Ripper.lex("total = price * 2").each { |position, event, token, state| p([position, event, token, state.to_s]) }
p Ripper.sexp("total = price * 2")
p Ripper.sexp_raw("[1, *rest]")
p Ripper.sexp(source)
p Ripper.sexp("def broken(")
p Ripper.lex_state_name(Ripper::EXPR_BEG | Ripper::EXPR_LABEL)

heredoc = "message = <<~TEXT\n    Deploy finished\n      on schedule\nTEXT\n"
p Ripper.sexp(heredoc)
p Ripper.lex(heredoc).map { |_position, event, token| [event, token] }

p Ripper.sexp("case reading\nin {status: 200, body:} then body\nin [Integer => code, *] then code\nend")

# A subclass sees each event through the method named for it.
class MethodNames < Ripper
  def on_def(name, _params, _body)
    (@names ||= []) << name
    name
  end

  def on_ident(token) = token

  def names
    parse
    @names
  end
end
p MethodNames.new("def start; end\ndef stop = nil\n").names

# A filter walks the tokens in order, threading a value through them.
class CommentCounter < Ripper::Filter
  def on_comment(token, count) = count + 1

  def on_default(_event, _token, count) = count
end
p CommentCounter.new("# setup\nvalue = 1 # inline\n").parse(0)

p Ripper.slice("print(1 + 2)", "ident")
p Ripper.dedent_string(+"    indented", 2)
```

Output:

```
["def", " ", "area", "(", "width", ",", " ", "height", " ", "=", " ", "2", ")", " ", "=", " ", "width", " ", "*", " ", "height", "\n", "puts", " ", "area", "(", "3", ")", "\n"]
[[1, 0], :on_ident, "total", "CMDARG"]
[[1, 5], :on_sp, " ", "CMDARG"]
[[1, 6], :on_op, "=", "BEG"]
[[1, 7], :on_sp, " ", "BEG"]
[[1, 8], :on_ident, "price", "ARG"]
[[1, 13], :on_sp, " ", "ARG"]
[[1, 14], :on_op, "*", "BEG"]
[[1, 15], :on_sp, " ", "BEG"]
[[1, 16], :on_int, "2", "END"]
[:program, [[:assign, [:var_field, [:@ident, "total", [1, 0]]], [:binary, [:vcall, [:@ident, "price", [1, 8]]], :*, [:@int, "2", [1, 16]]]]]]
[:program, [:stmts_add, [:stmts_new], [:array, [:args_add_star, [:args_add, [:args_new], [:@int, "1", [1, 1]]], [:vcall, [:@ident, "rest", [1, 5]]]]]]]
[:program, [[:def, [:@ident, "area", [1, 4]], [:paren, [:params, [[:@ident, "width", [1, 9]]], [[[:@ident, "height", [1, 16]], [:@int, "2", [1, 25]]]], nil, nil, nil, nil, nil]], [:bodystmt, [:binary, [:var_ref, [:@ident, "width", [1, 30]]], :*, [:var_ref, [:@ident, "height", [1, 38]]]], nil, nil, nil]], [:command, [:@ident, "puts", [2, 0]], [:args_add_block, [[:method_add_arg, [:fcall, [:@ident, "area", [2, 5]]], [:arg_paren, [:args_add_block, [[:@int, "3", [2, 10]]], false]]]], false]]]]
nil
"BEG|LABEL"
[:program, [[:assign, [:var_field, [:@ident, "message", [1, 0]]], [:string_literal, [:string_content, [:@tstring_content, "Deploy finished\n", [2, 4]], [:@tstring_content, "  on schedule\n", [3, 4]]]]]]]
[[:on_ident, "message"], [:on_sp, " "], [:on_op, "="], [:on_sp, " "], [:on_heredoc_beg, "<<~TEXT"], [:on_nl, "\n"], [:on_ignored_sp, "    "], [:on_tstring_content, "Deploy finished\n"], [:on_ignored_sp, "    "], [:on_tstring_content, "  on schedule\n"], [:on_heredoc_end, "TEXT\n"]]
[:program, [[:case, [:vcall, [:@ident, "reading", [1, 5]]], [:in, [:hshptn, nil, [[[:@label, "status:", [2, 4]], [:@int, "200", [2, 12]]], [[:@label, "body:", [2, 17]], nil]], nil], [[:var_ref, [:@ident, "body", [2, 29]]]], [:in, [:aryptn, nil, [[:binary, [:var_ref, [:@const, "Integer", [3, 4]]], :"=>", [:var_field, [:@ident, "code", [3, 15]]]]], [:var_field, nil], nil], [[:var_ref, [:@ident, "code", [3, 29]]]], nil]]]]]
["start", "stop"]
2
"print"
2
```
