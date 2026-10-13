---
title: "stdlib_libraries/ripper_grammar_forms.rb"
slug: stdlib-libraries-ripper-grammar-forms
description: "The metorex example program stdlib_libraries/ripper_grammar_forms.rb and its output."
---

`tests/_examples/stdlib_libraries/ripper_grammar_forms.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/ripper_grammar_forms.rb).

```metorex
# Ripper reads a separator after a condition, a command given as the one
# argument in parentheses, calls on a command's `do` block, and `return` in
# a singleton class the way MRI's parser does. A form MRI rejects gives nil.
require "ripper"

SOURCES = [
  "if a\n;b\nend",
  "if a;;b end",
  "if a ;\n ; b end",
  "if a\n\nb\nend",
  "if a;\nb\nend",
  "if a\nthen b end",
  "if a; then b end",
  "while a\n;b\nend",
  "while a;;b end",
  "until a\n\nb\nend",
  "for x in a\n;b\nend",
  "for x in a;b;end",
  "unless a\n;b\nend",
  "if a\nelsif c\n;b\nend",
  "case a\nwhen 1\n;b\nend",
  "case a\nwhen 1; ;b\nend",
  "begin\n;a\nrescue\n;b\nend",
  "while a do ;b end",
  "p(a.b 1)",
  "p(bar [2])",
  "p(gather ())",
  "p(a.b 1, 2)",
  "p(foo 1)",
  "p(foo 1, 2)",
  "foo(1, bar 2)",
  "p(foo 1 do end)",
  "foo do\nend.bar do\nend",
  "foo do end.bar 1 do end",
  "class << self; return 1; end",
  "class A; class << self; return 1; end; end",
  "foo(a.b 1)",
  "p(foo a: 1)",
  "p(foo 1, bar do end)",
  "p((foo 1 do end))",
  "p(foo bar { baz 1 do end })",
  "foo 1 do end",
  "foo 1 do end.bar do end",
  "foo 1 do end.bar",
  "foo 1 do end.bar 2",
  "foo 1 do end.bar { }",
  "foo 1 do end.bar(2) do end",
  "def m; class << self; return 1; end; end",
  "def m; class A; return 1; end; end",
  "def m; foo { class << self; return 1; end }; end",
  "TracePoint.new :call do |tp|\nend.enable do\nend",
  "a.b 1 do end.c do end.d",
  "foo 1 do end.bar(2)",
  "foo 1 do end.bar.baz",
].freeze

SOURCES.each { |source| p(Ripper.sexp(source)) }
```

Output:

```
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:void_stmt], [:vcall, [:@ident, "b", [2, 1]]]], nil]]]
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:void_stmt], [:vcall, [:@ident, "b", [1, 6]]]], nil]]]
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:void_stmt], [:vcall, [:@ident, "b", [2, 3]]]], nil]]]
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:vcall, [:@ident, "b", [3, 0]]]], nil]]]
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:vcall, [:@ident, "b", [2, 0]]]], nil]]]
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:vcall, [:@ident, "b", [2, 5]]]], nil]]]
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:vcall, [:@ident, "b", [1, 11]]]], nil]]]
[:program, [[:while, [:vcall, [:@ident, "a", [1, 6]]], [[:void_stmt], [:vcall, [:@ident, "b", [2, 1]]]]]]]
[:program, [[:while, [:vcall, [:@ident, "a", [1, 6]]], [[:void_stmt], [:vcall, [:@ident, "b", [1, 9]]]]]]]
[:program, [[:until, [:vcall, [:@ident, "a", [1, 6]]], [[:vcall, [:@ident, "b", [3, 0]]]]]]]
[:program, [[:for, [:var_field, [:@ident, "x", [1, 4]]], [:vcall, [:@ident, "a", [1, 9]]], [[:void_stmt], [:vcall, [:@ident, "b", [2, 1]]]]]]]
[:program, [[:for, [:var_field, [:@ident, "x", [1, 4]]], [:vcall, [:@ident, "a", [1, 9]]], [[:vcall, [:@ident, "b", [1, 11]]]]]]]
[:program, [[:unless, [:vcall, [:@ident, "a", [1, 7]]], [[:void_stmt], [:vcall, [:@ident, "b", [2, 1]]]], nil]]]
[:program, [[:if, [:vcall, [:@ident, "a", [1, 3]]], [[:void_stmt]], [:elsif, [:vcall, [:@ident, "c", [2, 6]]], [[:void_stmt], [:vcall, [:@ident, "b", [3, 1]]]], nil]]]]
[:program, [[:case, [:vcall, [:@ident, "a", [1, 5]]], [:when, [[:@int, "1", [2, 5]]], [[:void_stmt], [:vcall, [:@ident, "b", [3, 1]]]], nil]]]]
[:program, [[:case, [:vcall, [:@ident, "a", [1, 5]]], [:when, [[:@int, "1", [2, 5]]], [[:void_stmt], [:vcall, [:@ident, "b", [2, 9]]]], nil]]]]
[:program, [[:begin, [:bodystmt, [[:void_stmt], [:vcall, [:@ident, "a", [2, 1]]]], [:rescue, nil, nil, [[:void_stmt], [:vcall, [:@ident, "b", [4, 1]]]], nil], nil, nil]]]]
[:program, [[:while, [:vcall, [:@ident, "a", [1, 6]]], [[:void_stmt], [:vcall, [:@ident, "b", [1, 12]]]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command_call, [:vcall, [:@ident, "a", [1, 2]]], [:@period, ".", [1, 3]], [:@ident, "b", [1, 4]], [:args_add_block, [[:@int, "1", [1, 6]]], false]]]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command, [:@ident, "bar", [1, 2]], [:args_add_block, [[:array, [[:@int, "2", [1, 7]]]]], false]]]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command, [:@ident, "gather", [1, 2]], [:args_add_block, [[:paren, [[:void_stmt]]]], false]]]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command_call, [:vcall, [:@ident, "a", [1, 2]]], [:@period, ".", [1, 3]], [:@ident, "b", [1, 4]], [:args_add_block, [[:@int, "1", [1, 6]], [:@int, "2", [1, 9]]], false]]]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command, [:@ident, "foo", [1, 2]], [:args_add_block, [[:@int, "1", [1, 6]]], false]]]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command, [:@ident, "foo", [1, 2]], [:args_add_block, [[:@int, "1", [1, 6]], [:@int, "2", [1, 9]]], false]]]]]]]
nil
nil
[:program, [[:method_add_block, [:call, [:method_add_block, [:method_add_arg, [:fcall, [:@ident, "foo", [1, 0]]], []], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [2, 3]], [:@ident, "bar", [2, 4]]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]
[:program, [[:method_add_block, [:command_call, [:method_add_block, [:method_add_arg, [:fcall, [:@ident, "foo", [1, 0]]], []], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 10]], [:@ident, "bar", [1, 11]], [:args_add_block, [[:@int, "1", [1, 15]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]
nil
nil
[:program, [[:method_add_arg, [:fcall, [:@ident, "foo", [1, 0]]], [:arg_paren, [[:command_call, [:vcall, [:@ident, "a", [1, 4]]], [:@period, ".", [1, 5]], [:@ident, "b", [1, 6]], [:args_add_block, [[:@int, "1", [1, 8]]], false]]]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command, [:@ident, "foo", [1, 2]], [:args_add_block, [[:bare_assoc_hash, [[:assoc_new, [:@label, "a:", [1, 6]], [:@int, "1", [1, 9]]]]]], false]]]]]]]
nil
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [:args_add_block, [[:paren, [[:method_add_block, [:command, [:@ident, "foo", [1, 3]], [:args_add_block, [[:@int, "1", [1, 7]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]], false]]]]]
[:program, [[:method_add_arg, [:fcall, [:@ident, "p", [1, 0]]], [:arg_paren, [[:command, [:@ident, "foo", [1, 2]], [:args_add_block, [[:method_add_block, [:method_add_arg, [:fcall, [:@ident, "bar", [1, 6]]], []], [:brace_block, nil, [[:method_add_block, [:command, [:@ident, "baz", [1, 12]], [:args_add_block, [[:@int, "1", [1, 16]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]]], false]]]]]]]
[:program, [[:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]
[:program, [[:method_add_block, [:command_call, [:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "bar", [1, 13]], nil], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]
[:program, [[:call, [:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "bar", [1, 13]]]]]
[:program, [[:method_add_arg, [:call, [:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "bar", [1, 13]]], [:args_add_block, [[:@int, "2", [1, 17]]], false]]]]
[:program, [[:method_add_block, [:command_call, [:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "bar", [1, 13]], nil], [:brace_block, nil, [[:void_stmt]]]]]]
[:program, [[:method_add_block, [:command_call, [:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "bar", [1, 13]], [:arg_paren, [:args_add_block, [[:@int, "2", [1, 17]]], false]]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]
[:program, [[:def, [:@ident, "m", [1, 4]], [:params, nil, nil, nil, nil, nil, nil, nil], [:bodystmt, [[:sclass, [:var_ref, [:@kw, "self", [1, 16]]], [:bodystmt, [[:return, [:args_add_block, [[:@int, "1", [1, 29]]], false]]], nil, nil, nil]]], nil, nil, nil]]]]
nil
[:program, [[:def, [:@ident, "m", [1, 4]], [:params, nil, nil, nil, nil, nil, nil, nil], [:bodystmt, [[:method_add_block, [:method_add_arg, [:fcall, [:@ident, "foo", [1, 7]]], []], [:brace_block, nil, [[:sclass, [:var_ref, [:@kw, "self", [1, 22]]], [:bodystmt, [[:return, [:args_add_block, [[:@int, "1", [1, 35]]], false]]], nil, nil, nil]]]]]], nil, nil, nil]]]]
[:program, [[:method_add_block, [:command_call, [:method_add_block, [:command_call, [:var_ref, [:@const, "TracePoint", [1, 0]]], [:@period, ".", [1, 10]], [:@ident, "new", [1, 11]], [:args_add_block, [[:symbol_literal, [:symbol, [:@ident, "call", [1, 16]]]]], false]], [:do_block, [:block_var, [:params, [[:@ident, "tp", [1, 25]]], nil, nil, nil, nil, nil, nil], false], [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [2, 3]], [:@ident, "enable", [2, 4]], nil], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]]]]
[:program, [[:call, [:method_add_block, [:command_call, [:method_add_block, [:command_call, [:vcall, [:@ident, "a", [1, 0]]], [:@period, ".", [1, 1]], [:@ident, "b", [1, 2]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "c", [1, 13]], nil], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 21]], [:@ident, "d", [1, 22]]]]]
[:program, [[:method_add_arg, [:call, [:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "bar", [1, 13]]], [:arg_paren, [:args_add_block, [[:@int, "2", [1, 17]]], false]]]]]
[:program, [[:call, [:call, [:method_add_block, [:command, [:@ident, "foo", [1, 0]], [:args_add_block, [[:@int, "1", [1, 4]]], false]], [:do_block, nil, [:bodystmt, [[:void_stmt]], nil, nil, nil]]], [:@period, ".", [1, 12]], [:@ident, "bar", [1, 13]]], [:@period, ".", [1, 16]], [:@ident, "baz", [1, 17]]]]]
```
