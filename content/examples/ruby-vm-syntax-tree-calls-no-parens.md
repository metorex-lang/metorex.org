---
title: "ruby_vm/syntax_tree_calls_no_parens.rb"
slug: ruby-vm-syntax-tree-calls-no-parens
description: "The metorex example program ruby_vm/syntax_tree_calls_no_parens.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_calls_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_calls_no_parens.rb){target=_blank rel=noopener}.

```metorex
# RubyVM::AbstractSyntaxTree names each variable, constant, assignment and
# call the way MRI's parser does: which kind of variable is read or written,
# how a call was written, and how its arguments are grouped.

def dump(node)
  case node
  when RubyVM::AbstractSyntaxTree::Node
    inner = node.children.map { |child| dump(child) }.join(", ")
    "#{node.type}@#{node.first_lineno}:#{node.first_column}-#{node.last_lineno}:#{node.last_column}(#{inner})"
  when Array
    "[#{node.map { |item| dump(item) }.join(", ")}]"
  else
    node.inspect
  end
end

SOURCES = [
  "x = 1; x",
  "x = 1\nx + 2",
  "@a",
  "@a = 1",
  "$g",
  "$g = 1",
  "@@c",
  "Foo",
  "Foo::Bar",
  "::Foo",
  "Foo = 1",
  "Foo::Bar = 1",
  "foo",
  "foo()",
  "foo(1)",
  "foo 1, 2",
  "a.b",
  "a.b(1)",
  "a.b 1",
  "a&.b",
  "a&.b(1)",
  "a::b",
  "1 + 2",
  "1 - 2 * 3",
  "a == b",
  "!a",
  "-a",
  "a[1]",
  "a[1] = 2",
  "a.b = 3",
  "a&.b = 3",
  "[]",
  "[1, 2]",
  "[1, *a]",
  "[*a]",
  "{}",
  "{a: 1}",
  "{\"k\" => 1, b: 2}",
  "{**h}",
  "foo(*a)",
  "foo(&b)",
  "foo(1, &b)",
  "foo(a: 1)",
  "foo(**h)",
  "x = 1; x += 2",
  "x ||= 1",
  "x &&= 1",
  "a.b += 1",
  "a.b ||= 1",
  "a[0] += 1",
  "a[0] ||= 1",
  "Foo ||= 1",
  "Foo::Bar += 1",
  "@a ||= 1",
  "$g += 1",
  "a, b = 1, 2",
  "a, *b = c",
  "a, (b, c) = d",
  "*a = 1, 2",
  "a.b, c[0] = 1, 2",
  "a, b = *c",
  "x = y = 1",
  "p x",
  "foo.bar.baz",
  "foo(bar(1))",
  "a = [1, 2]; a[0]",
  "nil.to_s",
  "1.+(2)",
  "foo[1, 2]",
  "a.b.c = 1",
  "@a += 1",
  "A::B::C",
  "x = *a",
  "a = 1, 2",
  "p(*a, 1)",
  "foo(1, *a, 2)",
  "foo(1, a: 2)",
  "foo a: 1",
  "{a => b}",
  "a, = b",
  "a.()",
  "a[]",
  "!!a",
  "a ** -2",
  "a.b&.c",
  "$1",
  "-1.abs",
  "a.b(1, 2).c",
  "Foo.new(1)",
  "x = 1; x.y = 2",
  "@@c = 1",
  "@@c ||= 1",
  "a[1, 2] = 3",
  "a.b, *c = d",
  "(a, b), c = d",
  "foo(*a, &b)",
  "[[1], [2]]",
  "{a: {b: 1}}",
  "Foo::Bar.baz",
  "x = [*a, *b]",
  "foo(*a, *b)",
  "a.b(c: 1, **d)",
  "(1; 2)",
  "x = (1; 2)",
  "p((1; 2))",
  "(1)",
  "x = (1)",
  "(1; 2; 3)",
  "()",
  "x = ()",
  "foo(*a, **b, &c)",
  "foo(*a, b, &c)",
  "foo(*a, &c)",
  "x = 1; { x: }",
  "{ x: }",
  "foo(x:)",
  "def foo(x); bar(x:, y: 1); end",
  "[*super()]",
  "[*foo]",
  "0xffr",
  "-0xffr",
  "0b1111r",
  "0o17r",
  "0xffi",
  "[a: 1]",
  "[\"x\" => 1, \"y\" => 2]",
  "[1, a: 2]",
  "foo(**{})",
  "foo(**{a: 1})",
  "{**{}}",
  "[*a, b: 1]",
].freeze

SOURCES.each { |source| puts dump(RubyVM::AbstractSyntaxTree.parse(source)) }
```

Output:

```
SCOPE@1:0-1:8([:x], nil, BLOCK@1:0-1:8(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), LVAR@1:7-1:8(:x)))
SCOPE@1:0-2:5([:x], nil, BLOCK@1:0-2:5(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), OPCALL@2:0-2:5(LVAR@2:0-2:1(:x), :+, LIST@2:4-2:5(INTEGER@2:4-2:5(2), nil))))
SCOPE@1:0-1:2([], nil, IVAR@1:0-1:2(:@a))
SCOPE@1:0-1:6([], nil, IASGN@1:0-1:6(:@a, INTEGER@1:5-1:6(1)))
SCOPE@1:0-1:2([], nil, GVAR@1:0-1:2(:$g))
SCOPE@1:0-1:6([], nil, GASGN@1:0-1:6(:$g, INTEGER@1:5-1:6(1)))
SCOPE@1:0-1:3([], nil, CVAR@1:0-1:3(:@@c))
SCOPE@1:0-1:3([], nil, CONST@1:0-1:3(:Foo))
SCOPE@1:0-1:8([], nil, COLON2@1:0-1:8(CONST@1:0-1:3(:Foo), :Bar))
SCOPE@1:0-1:5([], nil, COLON3@1:0-1:5(:Foo))
SCOPE@1:0-1:7([], nil, CDECL@1:0-1:7(:Foo, INTEGER@1:6-1:7(1)))
SCOPE@1:0-1:12([], nil, CDECL@1:0-1:12(COLON2@1:0-1:8(CONST@1:0-1:3(:Foo), :Bar), :Bar, INTEGER@1:11-1:12(1)))
SCOPE@1:0-1:3([], nil, VCALL@1:0-1:3(:foo))
SCOPE@1:0-1:5([], nil, FCALL@1:0-1:5(:foo, nil))
SCOPE@1:0-1:6([], nil, FCALL@1:0-1:6(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)))
SCOPE@1:0-1:8([], nil, FCALL@1:0-1:8(:foo, LIST@1:4-1:8(INTEGER@1:4-1:5(1), INTEGER@1:7-1:8(2), nil)))
SCOPE@1:0-1:3([], nil, CALL@1:0-1:3(VCALL@1:0-1:1(:a), :b, nil))
SCOPE@1:0-1:6([], nil, CALL@1:0-1:6(VCALL@1:0-1:1(:a), :b, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)))
SCOPE@1:0-1:5([], nil, CALL@1:0-1:5(VCALL@1:0-1:1(:a), :b, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)))
SCOPE@1:0-1:4([], nil, QCALL@1:0-1:4(VCALL@1:0-1:1(:a), :b, nil))
SCOPE@1:0-1:7([], nil, QCALL@1:0-1:7(VCALL@1:0-1:1(:a), :b, LIST@1:5-1:6(INTEGER@1:5-1:6(1), nil)))
SCOPE@1:0-1:4([], nil, CALL@1:0-1:4(VCALL@1:0-1:1(:a), :b, nil))
SCOPE@1:0-1:5([], nil, OPCALL@1:0-1:5(INTEGER@1:0-1:1(1), :+, LIST@1:4-1:5(INTEGER@1:4-1:5(2), nil)))
SCOPE@1:0-1:9([], nil, OPCALL@1:0-1:9(INTEGER@1:0-1:1(1), :-, LIST@1:4-1:9(OPCALL@1:4-1:9(INTEGER@1:4-1:5(2), :*, LIST@1:8-1:9(INTEGER@1:8-1:9(3), nil)), nil)))
SCOPE@1:0-1:6([], nil, OPCALL@1:0-1:6(VCALL@1:0-1:1(:a), :==, LIST@1:5-1:6(VCALL@1:5-1:6(:b), nil)))
SCOPE@1:0-1:2([], nil, OPCALL@1:0-1:2(VCALL@1:1-1:2(:a), :!, nil))
SCOPE@1:0-1:2([], nil, OPCALL@1:0-1:2(VCALL@1:1-1:2(:a), :-@, nil))
SCOPE@1:0-1:4([], nil, CALL@1:0-1:4(VCALL@1:0-1:1(:a), :[], LIST@1:2-1:3(INTEGER@1:2-1:3(1), nil)))
SCOPE@1:0-1:8([], nil, ATTRASGN@1:0-1:8(VCALL@1:0-1:1(:a), :[]=, LIST@1:2-1:8(INTEGER@1:2-1:3(1), INTEGER@1:7-1:8(2), nil)))
SCOPE@1:0-1:7([], nil, ATTRASGN@1:0-1:7(VCALL@1:0-1:1(:a), :b=, LIST@1:6-1:7(INTEGER@1:6-1:7(3), nil)))
SCOPE@1:0-1:8([], nil, ATTRASGN@1:0-1:8(VCALL@1:0-1:1(:a), :b, LIST@1:7-1:8(INTEGER@1:7-1:8(3), nil)))
SCOPE@1:0-1:2([], nil, ZLIST@1:0-1:2())
SCOPE@1:0-1:6([], nil, LIST@1:0-1:6(INTEGER@1:1-1:2(1), INTEGER@1:4-1:5(2), nil))
SCOPE@1:0-1:7([], nil, ARGSCAT@1:0-1:7(LIST@1:1-1:2(INTEGER@1:1-1:2(1), nil), VCALL@1:5-1:6(:a)))
SCOPE@1:0-1:4([], nil, SPLAT@1:0-1:4(VCALL@1:2-1:3(:a)))
SCOPE@1:0-1:2([], nil, HASH@1:0-1:2(nil))
SCOPE@1:0-1:6([], nil, HASH@1:0-1:6(LIST@1:1-1:5(SYM@1:1-1:3(:a), INTEGER@1:4-1:5(1), nil)))
SCOPE@1:0-1:16([], nil, HASH@1:0-1:16(LIST@1:1-1:15(STR@1:1-1:4("k"), INTEGER@1:8-1:9(1), SYM@1:11-1:13(:b), INTEGER@1:14-1:15(2), nil)))
SCOPE@1:0-1:5([], nil, HASH@1:0-1:5(LIST@1:1-1:4(nil, VCALL@1:3-1:4(:h), nil)))
SCOPE@1:0-1:7([], nil, FCALL@1:0-1:7(:foo, SPLAT@1:4-1:6(VCALL@1:5-1:6(:a))))
SCOPE@1:0-1:7([], nil, FCALL@1:0-1:7(:foo, BLOCK_PASS@1:4-1:6(nil, VCALL@1:5-1:6(:b))))
SCOPE@1:0-1:10([], nil, FCALL@1:0-1:10(:foo, BLOCK_PASS@1:4-1:9(LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil), VCALL@1:8-1:9(:b))))
SCOPE@1:0-1:9([], nil, FCALL@1:0-1:9(:foo, LIST@1:4-1:8(HASH@1:4-1:8(LIST@1:4-1:8(SYM@1:4-1:6(:a), INTEGER@1:7-1:8(1), nil)), nil)))
SCOPE@1:0-1:8([], nil, FCALL@1:0-1:8(:foo, LIST@1:4-1:7(HASH@1:4-1:7(LIST@1:4-1:7(nil, VCALL@1:6-1:7(:h), nil)), nil)))
SCOPE@1:0-1:13([:x], nil, BLOCK@1:0-1:13(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), LASGN@1:7-1:13(:x, CALL@1:7-1:13(LVAR@1:7-1:8(:x), :+, LIST@1:12-1:13(INTEGER@1:12-1:13(2), nil)))))
SCOPE@1:0-1:7([:x], nil, OP_ASGN_OR@1:0-1:7(LVAR@1:0-1:1(:x), :"||", LASGN@1:0-1:7(:x, INTEGER@1:6-1:7(1))))
SCOPE@1:0-1:7([:x], nil, OP_ASGN_AND@1:0-1:7(LVAR@1:0-1:1(:x), :"&&", LASGN@1:0-1:7(:x, INTEGER@1:6-1:7(1))))
SCOPE@1:0-1:8([], nil, OP_ASGN2@1:0-1:8(VCALL@1:0-1:1(:a), false, :b, :+, INTEGER@1:7-1:8(1)))
SCOPE@1:0-1:9([], nil, OP_ASGN2@1:0-1:9(VCALL@1:0-1:1(:a), false, :b, :"||", INTEGER@1:8-1:9(1)))
SCOPE@1:0-1:9([], nil, OP_ASGN1@1:0-1:9(VCALL@1:0-1:1(:a), :+, LIST@1:2-1:3(INTEGER@1:2-1:3(0), nil), INTEGER@1:8-1:9(1)))
SCOPE@1:0-1:10([], nil, OP_ASGN1@1:0-1:10(VCALL@1:0-1:1(:a), :"||", LIST@1:2-1:3(INTEGER@1:2-1:3(0), nil), INTEGER@1:9-1:10(1)))
SCOPE@1:0-1:9([], nil, OP_ASGN_OR@1:0-1:9(CONST@1:0-1:3(:Foo), :"||", CDECL@1:0-1:9(:Foo, INTEGER@1:8-1:9(1))))
SCOPE@1:0-1:13([], nil, OP_CDECL@1:0-1:13(COLON2@1:0-1:8(CONST@1:0-1:3(:Foo), :Bar), :+, INTEGER@1:12-1:13(1)))
SCOPE@1:0-1:8([], nil, OP_ASGN_OR@1:0-1:8(IVAR@1:0-1:2(:@a), :"||", IASGN@1:0-1:8(:@a, INTEGER@1:7-1:8(1))))
SCOPE@1:0-1:7([], nil, GASGN@1:0-1:7(:$g, CALL@1:0-1:7(GVAR@1:0-1:2(:$g), :+, LIST@1:6-1:7(INTEGER@1:6-1:7(1), nil))))
SCOPE@1:0-1:11([:a, :b], nil, MASGN@1:0-1:11(LIST@1:7-1:11(INTEGER@1:7-1:8(1), INTEGER@1:10-1:11(2), nil), LIST@1:0-1:4(LASGN@1:0-1:1(:a, nil), LASGN@1:3-1:4(:b, nil), nil), nil))
SCOPE@1:0-1:9([:a, :b], nil, MASGN@1:0-1:9(VCALL@1:8-1:9(:c), LIST@1:0-1:1(LASGN@1:0-1:1(:a, nil), nil), LASGN@1:4-1:5(:b, nil)))
SCOPE@1:0-1:13([:a, :b, :c], nil, MASGN@1:0-1:13(VCALL@1:12-1:13(:d), LIST@1:0-1:8(LASGN@1:0-1:1(:a, nil), MASGN@1:4-1:8(nil, LIST@1:4-1:8(LASGN@1:4-1:5(:b, nil), LASGN@1:7-1:8(:c, nil), nil), nil), nil), nil))
SCOPE@1:0-1:9([:a], nil, MASGN@1:0-1:9(LIST@1:5-1:9(INTEGER@1:5-1:6(1), INTEGER@1:8-1:9(2), nil), nil, LASGN@1:1-1:2(:a, nil)))
SCOPE@1:0-1:16([], nil, MASGN@1:0-1:16(LIST@1:12-1:16(INTEGER@1:12-1:13(1), INTEGER@1:15-1:16(2), nil), LIST@1:0-1:9(ATTRASGN@1:0-1:3(VCALL@1:0-1:1(:a), :b=, nil), ATTRASGN@1:5-1:9(VCALL@1:5-1:6(:c), :[]=, LIST@1:7-1:8(INTEGER@1:7-1:8(0), nil)), nil), nil))
SCOPE@1:0-1:9([:a, :b], nil, MASGN@1:0-1:9(SPLAT@1:7-1:9(VCALL@1:8-1:9(:c)), LIST@1:0-1:4(LASGN@1:0-1:1(:a, nil), LASGN@1:3-1:4(:b, nil), nil), nil))
SCOPE@1:0-1:9([:x, :y], nil, LASGN@1:0-1:9(:x, LASGN@1:4-1:9(:y, INTEGER@1:8-1:9(1))))
SCOPE@1:0-1:3([], nil, FCALL@1:0-1:3(:p, LIST@1:2-1:3(VCALL@1:2-1:3(:x), nil)))
SCOPE@1:0-1:11([], nil, CALL@1:0-1:11(CALL@1:0-1:7(VCALL@1:0-1:3(:foo), :bar, nil), :baz, nil))
SCOPE@1:0-1:11([], nil, FCALL@1:0-1:11(:foo, LIST@1:4-1:10(FCALL@1:4-1:10(:bar, LIST@1:8-1:9(INTEGER@1:8-1:9(1), nil)), nil)))
SCOPE@1:0-1:16([:a], nil, BLOCK@1:0-1:16(LASGN@1:0-1:10(:a, LIST@1:4-1:10(INTEGER@1:5-1:6(1), INTEGER@1:8-1:9(2), nil)), CALL@1:12-1:16(LVAR@1:12-1:13(:a), :[], LIST@1:14-1:15(INTEGER@1:14-1:15(0), nil))))
SCOPE@1:0-1:8([], nil, CALL@1:0-1:8(NIL@1:0-1:3(), :to_s, nil))
SCOPE@1:0-1:6([], nil, CALL@1:0-1:6(INTEGER@1:0-1:1(1), :+, LIST@1:4-1:5(INTEGER@1:4-1:5(2), nil)))
SCOPE@1:0-1:9([], nil, CALL@1:0-1:9(VCALL@1:0-1:3(:foo), :[], LIST@1:4-1:8(INTEGER@1:4-1:5(1), INTEGER@1:7-1:8(2), nil)))
SCOPE@1:0-1:9([], nil, ATTRASGN@1:0-1:9(CALL@1:0-1:3(VCALL@1:0-1:1(:a), :b, nil), :c=, LIST@1:8-1:9(INTEGER@1:8-1:9(1), nil)))
SCOPE@1:0-1:7([], nil, IASGN@1:0-1:7(:@a, CALL@1:0-1:7(IVAR@1:0-1:2(:@a), :+, LIST@1:6-1:7(INTEGER@1:6-1:7(1), nil))))
SCOPE@1:0-1:7([], nil, COLON2@1:0-1:7(COLON2@1:0-1:4(CONST@1:0-1:1(:A), :B), :C))
SCOPE@1:0-1:6([:x], nil, LASGN@1:0-1:6(:x, SPLAT@1:4-1:6(VCALL@1:5-1:6(:a))))
SCOPE@1:0-1:8([:a], nil, LASGN@1:0-1:8(:a, LIST@1:4-1:8(INTEGER@1:4-1:5(1), INTEGER@1:7-1:8(2), nil)))
SCOPE@1:0-1:8([], nil, FCALL@1:0-1:8(:p, ARGSPUSH@1:2-1:7(SPLAT@1:2-1:4(VCALL@1:3-1:4(:a)), INTEGER@1:6-1:7(1))))
SCOPE@1:0-1:13([], nil, FCALL@1:0-1:13(:foo, ARGSPUSH@1:4-1:12(ARGSCAT@1:4-1:9(LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil), VCALL@1:8-1:9(:a)), INTEGER@1:11-1:12(2))))
SCOPE@1:0-1:12([], nil, FCALL@1:0-1:12(:foo, LIST@1:4-1:11(INTEGER@1:4-1:5(1), HASH@1:7-1:11(LIST@1:7-1:11(SYM@1:7-1:9(:a), INTEGER@1:10-1:11(2), nil)), nil)))
SCOPE@1:0-1:8([], nil, FCALL@1:0-1:8(:foo, LIST@1:4-1:8(HASH@1:4-1:8(LIST@1:4-1:8(SYM@1:4-1:6(:a), INTEGER@1:7-1:8(1), nil)), nil)))
SCOPE@1:0-1:8([], nil, HASH@1:0-1:8(LIST@1:1-1:7(VCALL@1:1-1:2(:a), VCALL@1:6-1:7(:b), nil)))
SCOPE@1:0-1:6([:a], nil, MASGN@1:0-1:6(VCALL@1:5-1:6(:b), LIST@1:0-1:1(LASGN@1:0-1:1(:a, nil), nil), nil))
SCOPE@1:0-1:4([], nil, CALL@1:0-1:4(VCALL@1:0-1:1(:a), :call, nil))
SCOPE@1:0-1:3([], nil, CALL@1:0-1:3(VCALL@1:0-1:1(:a), :[], nil))
SCOPE@1:0-1:3([], nil, OPCALL@1:0-1:3(OPCALL@1:1-1:3(VCALL@1:2-1:3(:a), :!, nil), :!, nil))
SCOPE@1:0-1:7([], nil, OPCALL@1:0-1:7(VCALL@1:0-1:1(:a), :**, LIST@1:5-1:7(INTEGER@1:5-1:7(-2), nil)))
SCOPE@1:0-1:6([], nil, QCALL@1:0-1:6(CALL@1:0-1:3(VCALL@1:0-1:1(:a), :b, nil), :c, nil))
SCOPE@1:0-1:2([], nil, NTH_REF@1:0-1:2(:$1))
SCOPE@1:0-1:6([], nil, CALL@1:0-1:6(INTEGER@1:0-1:2(-1), :abs, nil))
SCOPE@1:0-1:11([], nil, CALL@1:0-1:11(CALL@1:0-1:9(VCALL@1:0-1:1(:a), :b, LIST@1:4-1:8(INTEGER@1:4-1:5(1), INTEGER@1:7-1:8(2), nil)), :c, nil))
SCOPE@1:0-1:10([], nil, CALL@1:0-1:10(CONST@1:0-1:3(:Foo), :new, LIST@1:8-1:9(INTEGER@1:8-1:9(1), nil)))
SCOPE@1:0-1:14([:x], nil, BLOCK@1:0-1:14(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), ATTRASGN@1:7-1:14(LVAR@1:7-1:8(:x), :y=, LIST@1:13-1:14(INTEGER@1:13-1:14(2), nil))))
SCOPE@1:0-1:7([], nil, CVASGN@1:0-1:7(:@@c, INTEGER@1:6-1:7(1)))
SCOPE@1:0-1:9([], nil, OP_ASGN_OR@1:0-1:9(CVAR@1:0-1:3(:@@c), :"||", CVASGN@1:0-1:9(:@@c, INTEGER@1:8-1:9(1))))
SCOPE@1:0-1:11([], nil, ATTRASGN@1:0-1:11(VCALL@1:0-1:1(:a), :[]=, LIST@1:2-1:11(INTEGER@1:2-1:3(1), INTEGER@1:5-1:6(2), INTEGER@1:10-1:11(3), nil)))
SCOPE@1:0-1:11([:c], nil, MASGN@1:0-1:11(VCALL@1:10-1:11(:d), LIST@1:0-1:3(ATTRASGN@1:0-1:3(VCALL@1:0-1:1(:a), :b=, nil), nil), LASGN@1:6-1:7(:c, nil)))
SCOPE@1:0-1:13([:a, :b, :c], nil, MASGN@1:0-1:13(VCALL@1:12-1:13(:d), LIST@1:0-1:9(MASGN@1:1-1:5(nil, LIST@1:1-1:5(LASGN@1:1-1:2(:a, nil), LASGN@1:4-1:5(:b, nil), nil), nil), LASGN@1:8-1:9(:c, nil), nil), nil))
SCOPE@1:0-1:11([], nil, FCALL@1:0-1:11(:foo, BLOCK_PASS@1:4-1:10(SPLAT@1:4-1:6(VCALL@1:5-1:6(:a)), VCALL@1:9-1:10(:b))))
SCOPE@1:0-1:10([], nil, LIST@1:0-1:10(LIST@1:1-1:4(INTEGER@1:2-1:3(1), nil), LIST@1:6-1:9(INTEGER@1:7-1:8(2), nil), nil))
SCOPE@1:0-1:11([], nil, HASH@1:0-1:11(LIST@1:1-1:10(SYM@1:1-1:3(:a), HASH@1:4-1:10(LIST@1:5-1:9(SYM@1:5-1:7(:b), INTEGER@1:8-1:9(1), nil)), nil)))
SCOPE@1:0-1:12([], nil, CALL@1:0-1:12(COLON2@1:0-1:8(CONST@1:0-1:3(:Foo), :Bar), :baz, nil))
SCOPE@1:0-1:12([:x], nil, LASGN@1:0-1:12(:x, ARGSCAT@1:4-1:12(SPLAT@1:5-1:7(VCALL@1:6-1:7(:a)), VCALL@1:10-1:11(:b))))
SCOPE@1:0-1:11([], nil, FCALL@1:0-1:11(:foo, ARGSCAT@1:4-1:10(SPLAT@1:4-1:6(VCALL@1:5-1:6(:a)), VCALL@1:9-1:10(:b))))
SCOPE@1:0-1:14([], nil, CALL@1:0-1:14(VCALL@1:0-1:1(:a), :b, LIST@1:4-1:13(HASH@1:4-1:13(LIST@1:4-1:13(SYM@1:4-1:6(:c), INTEGER@1:7-1:8(1), nil, VCALL@1:12-1:13(:d), nil)), nil)))
SCOPE@1:0-1:6([], nil, BLOCK@1:0-1:6(BLOCK@1:1-1:5(INTEGER@1:1-1:2(1), INTEGER@1:4-1:5(2))))
SCOPE@1:0-1:10([:x], nil, LASGN@1:0-1:10(:x, BLOCK@1:4-1:10(BLOCK@1:5-1:9(INTEGER@1:5-1:6(1), INTEGER@1:8-1:9(2)))))
SCOPE@1:0-1:9([], nil, FCALL@1:0-1:9(:p, LIST@1:2-1:8(BLOCK@1:2-1:8(BLOCK@1:3-1:7(INTEGER@1:3-1:4(1), INTEGER@1:6-1:7(2))), nil)))
SCOPE@1:0-1:3([], nil, BLOCK@1:0-1:3(INTEGER@1:1-1:2(1)))
SCOPE@1:0-1:7([:x], nil, LASGN@1:0-1:7(:x, BLOCK@1:4-1:7(INTEGER@1:5-1:6(1))))
SCOPE@1:0-1:9([], nil, BLOCK@1:0-1:9(BLOCK@1:1-1:8(INTEGER@1:1-1:2(1), INTEGER@1:4-1:5(2), INTEGER@1:7-1:8(3))))
SCOPE@1:0-1:2([], nil, BLOCK@1:0-1:2(BEGIN@1:1-1:1(nil)))
SCOPE@1:0-1:6([:x], nil, LASGN@1:0-1:6(:x, BLOCK@1:4-1:6(BEGIN@1:5-1:5(nil))))
SCOPE@1:0-1:16([], nil, FCALL@1:0-1:16(:foo, BLOCK_PASS@1:4-1:15(ARGSPUSH@1:4-1:15(SPLAT@1:4-1:6(VCALL@1:5-1:6(:a)), HASH@1:8-1:11(LIST@1:8-1:11(nil, VCALL@1:10-1:11(:b), nil))), VCALL@1:14-1:15(:c))))
SCOPE@1:0-1:14([], nil, FCALL@1:0-1:14(:foo, BLOCK_PASS@1:4-1:13(ARGSPUSH@1:4-1:9(SPLAT@1:4-1:6(VCALL@1:5-1:6(:a)), VCALL@1:8-1:9(:b)), VCALL@1:12-1:13(:c))))
SCOPE@1:0-1:11([], nil, FCALL@1:0-1:11(:foo, BLOCK_PASS@1:4-1:10(SPLAT@1:4-1:6(VCALL@1:5-1:6(:a)), VCALL@1:9-1:10(:c))))
SCOPE@1:0-1:13([:x], nil, BLOCK@1:0-1:13(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), HASH@1:7-1:13(LIST@1:9-1:11(SYM@1:9-1:11(:x), LVAR@1:9-1:11(:x), nil))))
SCOPE@1:0-1:6([], nil, HASH@1:0-1:6(LIST@1:2-1:4(SYM@1:2-1:4(:x), VCALL@1:2-1:4(:x), nil)))
SCOPE@1:0-1:7([], nil, FCALL@1:0-1:7(:foo, LIST@1:4-1:6(HASH@1:4-1:6(LIST@1:4-1:6(SYM@1:4-1:6(:x), VCALL@1:4-1:6(:x), nil)), nil)))
SCOPE@1:0-1:30([], nil, DEFN@1:0-1:30(:foo, SCOPE@1:0-1:30([:x], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:10-1:25(BEGIN@1:10-1:10(nil), FCALL@1:12-1:25(:bar, LIST@1:16-1:24(HASH@1:16-1:24(LIST@1:16-1:24(SYM@1:16-1:18(:x), LVAR@1:16-1:18(:x), SYM@1:20-1:22(:y), INTEGER@1:23-1:24(1), nil)), nil))))))
SCOPE@1:0-1:10([], nil, SPLAT@1:0-1:10(SUPER@1:2-1:9(nil)))
SCOPE@1:0-1:6([], nil, SPLAT@1:0-1:6(VCALL@1:2-1:5(:foo)))
SCOPE@1:0-1:5([], nil, RATIONAL@1:0-1:5((255/1)))
SCOPE@1:0-1:6([], nil, RATIONAL@1:0-1:6((-255/1)))
SCOPE@1:0-1:7([], nil, RATIONAL@1:0-1:7((15/1)))
SCOPE@1:0-1:5([], nil, RATIONAL@1:0-1:5((15/1)))
SCOPE@1:0-1:5([], nil, IMAGINARY@1:0-1:5((0+255i)))
SCOPE@1:0-1:6([], nil, LIST@1:0-1:6(HASH@1:1-1:5(LIST@1:1-1:5(SYM@1:1-1:3(:a), INTEGER@1:4-1:5(1), nil)), nil))
SCOPE@1:0-1:20([], nil, LIST@1:0-1:20(HASH@1:1-1:19(LIST@1:1-1:19(STR@1:1-1:4("x"), INTEGER@1:8-1:9(1), STR@1:11-1:14("y"), INTEGER@1:18-1:19(2), nil)), nil))
SCOPE@1:0-1:9([], nil, LIST@1:0-1:9(INTEGER@1:1-1:2(1), HASH@1:4-1:8(LIST@1:4-1:8(SYM@1:4-1:6(:a), INTEGER@1:7-1:8(2), nil)), nil))
SCOPE@1:0-1:9([], nil, FCALL@1:0-1:9(:foo, LIST@1:4-1:8(HASH@1:4-1:8(LIST@1:4-1:8(nil, HASH@1:6-1:8(nil), nil)), nil)))
SCOPE@1:0-1:13([], nil, FCALL@1:0-1:13(:foo, LIST@1:4-1:12(HASH@1:4-1:12(LIST@1:4-1:12(nil, HASH@1:6-1:12(LIST@1:7-1:11(SYM@1:7-1:9(:a), INTEGER@1:10-1:11(1), nil)), nil)), nil)))
SCOPE@1:0-1:6([], nil, HASH@1:0-1:6(LIST@1:1-1:5(nil, HASH@1:3-1:5(nil), nil)))
SCOPE@1:0-1:10([], nil, ARGSPUSH@1:0-1:10(SPLAT@1:1-1:3(VCALL@1:2-1:3(:a)), HASH@1:5-1:9(LIST@1:5-1:9(SYM@1:5-1:7(:b), INTEGER@1:8-1:9(1), nil))))
```
