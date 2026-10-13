---
title: "ruby_vm/syntax_tree_control.rb"
slug: ruby-vm-syntax-tree-control
description: "The metorex example program ruby_vm/syntax_tree_control.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_control.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_control.rb){target=_blank rel=noopener}.

```metorex
# RubyVM::AbstractSyntaxTree names each conditional, loop, jump and
# exception handler the way MRI's parser does, including where an empty body
# begins and when a `begin` keeps its own node.

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
  "if a then 1 end",
  "if a\n  1\nelse\n  2\nend",
  "if a\n  1\nelsif b\n  2\nelse\n  3\nend",
  "unless a\n  1\nelse\n  2\nend",
  "x if a",
  "x unless a",
  "a ? 1 : 2",
  "while a\n  b\nend",
  "until a\n  b\nend",
  "x while a",
  "x until a",
  "begin\n  x\nend while a",
  "while a do b end",
  "case a\nwhen 1 then :one\nwhen 2, 3 then :more\nelse :other\nend",
  "case\nwhen a then 1\nend",
  "case a\nwhen *b then 1\nend",
  "a and b",
  "a or b",
  "not a",
  "a && b",
  "a || b",
  "a && b || c",
  "begin\n  a\nrescue\n  b\nend",
  "begin\n  a\nrescue Foo => e\n  b\nrescue Bar, Baz\n  c\nelse\n  d\nensure\n  f\nend",
  "begin\n  a\nensure\n  b\nend",
  "a rescue b",
  "begin\nend",
  "while a\n  break\nend",
  "while a\n  break 1\nend",
  "while a\n  next\nend",
  "while a\n  redo\nend",
  "begin\n  a\nrescue\n  retry\nend",
  "return",
  "return 1",
  "return 1, 2",
  "for x in a\n  b\nend",
  "for a, b in c\n  d\nend",
  "1..2",
  "1...2",
  "(1..)",
  "(..2)",
  "a..b",
  "if (a == 1)..(a == 2) then x end",
  "if (a == 1)...(a == 2) then x end",
  "x = if a then 1 else 2 end",
  "a = b rescue c",
  "break if a",
  "begin\n  a\nend",
  "begin\n  a\n  b\nend",
  "for @x in a do end",
  "break 1, 2",
  "if a\nend",
  "while a\nend",
  "case a\nwhen 1\nend",
  "while a\n  if b then c end\nend",
  "while true do end",
  "case a; when 1; end",
  "until a do end",
  "begin; end until a",
  "return if a",
  "a or b and c",
  "begin\n  a\nrescue => e\n  e\nend",
  "begin a rescue b end",
  "x = begin 1 end",
  "a ? b ? 1 : 2 : 3",
  "if a then elsif b then end",
  "x = 1..2 if a",
  "unless a then b end",
  "case a\nwhen 1\n  b\n  c\nelse\nend",
  "begin\n  a\nrescue A\nrescue B => b\nend",
  "for i in 1..3 do p i end",
  "not(a)",
  "!a.b",
  "a && !b",
  "while a; b; c; end",
  "begin\n  a\nensure\nend",
  "x = (a or b)",
  "if a; b; else; c; end",
  "if a; end",
  "while a; end",
  "until a; end",
  "begin; end",
  "for x in a; end",
  "unless a; end",
  "if a then; end",
  "begin; a; end",
  "x = begin; a; end",
  "x = begin\n a\nrescue\n b\nend",
  "foo(begin 1 end)",
  "begin 1 end.to_s",
  "[begin 1 end]",
  "while a do; b; end",
  "if a; else; end",
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
  "def foo; 1; ensure; 2; end",
  "def foo; 1; ensure; 2 end",
  "def foo\n1\nensure\n2\nend",
  "begin; 1; ensure; 2; end",
  "begin 1; ensure 2; end",
  "foo do 1; ensure; 2; end",
  "def foo; 1; rescue; 2; end",
  "def foo; 1; rescue; 2; else; 3; ensure; 4; end",
  "class A; 1; ensure; 2; end",
  "def foo(...); x { bar(...) }; end",
  "def foo(&); x { bar(&) }; end",
  "begin; a; rescue A; b; rescue B; c; end",
  "begin; a; rescue A; b; rescue B; c; ensure; d; end",
  "begin; a; rescue; b;; end",
  "begin; a; rescue; ; end",
  "begin; a; ensure; ; end",
  "begin; a; rescue; b; else; c; end",
  "begin\na\nrescue\nb;\nend",
  "begin; a; rescue => e; end",
  "for first, in pairs; end",
  "for holder.seen in [7, 8]; end",
  "for head, *tail in a; end",
  "for @a in b; end",
  "for a[0] in b; end",
].freeze

SOURCES.each do |source|
  puts(dump(RubyVM::AbstractSyntaxTree.parse(source)))
rescue SyntaxError => error
  puts("SyntaxError: #{error.message.lines.first.chomp}")
end
```

Output:

```
SCOPE@1:0-1:15([], nil, IF@1:0-1:15(VCALL@1:3-1:4(:a), INTEGER@1:10-1:11(1), nil))
SCOPE@1:0-5:3([], nil, IF@1:0-5:3(VCALL@1:3-1:4(:a), INTEGER@2:2-2:3(1), INTEGER@4:2-4:3(2)))
SCOPE@1:0-7:3([], nil, IF@1:0-7:3(VCALL@1:3-1:4(:a), INTEGER@2:2-2:3(1), IF@3:0-6:3(VCALL@3:6-3:7(:b), INTEGER@4:2-4:3(2), INTEGER@6:2-6:3(3))))
SCOPE@1:0-5:3([], nil, UNLESS@1:0-5:3(VCALL@1:7-1:8(:a), INTEGER@2:2-2:3(1), INTEGER@4:2-4:3(2)))
SCOPE@1:0-1:6([], nil, IF@1:0-1:6(VCALL@1:5-1:6(:a), VCALL@1:0-1:1(:x), nil))
SCOPE@1:0-1:10([], nil, UNLESS@1:0-1:10(VCALL@1:9-1:10(:a), VCALL@1:0-1:1(:x), nil))
SCOPE@1:0-1:9([], nil, IF@1:0-1:9(VCALL@1:0-1:1(:a), INTEGER@1:4-1:5(1), INTEGER@1:8-1:9(2)))
SCOPE@1:0-3:3([], nil, WHILE@1:0-3:3(VCALL@1:6-1:7(:a), VCALL@2:2-2:3(:b), true))
SCOPE@1:0-3:3([], nil, UNTIL@1:0-3:3(VCALL@1:6-1:7(:a), VCALL@2:2-2:3(:b), true))
SCOPE@1:0-1:9([], nil, WHILE@1:0-1:9(VCALL@1:8-1:9(:a), VCALL@1:0-1:1(:x), true))
SCOPE@1:0-1:9([], nil, UNTIL@1:0-1:9(VCALL@1:8-1:9(:a), VCALL@1:0-1:1(:x), true))
SCOPE@1:0-3:11([], nil, WHILE@1:0-3:11(VCALL@3:10-3:11(:a), VCALL@2:2-2:3(:x), false))
SCOPE@1:0-1:16([], nil, WHILE@1:0-1:16(VCALL@1:6-1:7(:a), VCALL@1:11-1:12(:b), true))
SCOPE@1:0-5:3([], nil, CASE@1:0-5:3(VCALL@1:5-1:6(:a), WHEN@2:0-4:11(LIST@2:5-2:6(INTEGER@2:5-2:6(1), nil), SYM@2:12-2:16(:one), WHEN@3:0-4:11(LIST@3:5-3:9(INTEGER@3:5-3:6(2), INTEGER@3:8-3:9(3), nil), SYM@3:15-3:20(:more), SYM@4:5-4:11(:other)))))
SCOPE@1:0-3:3([], nil, CASE2@1:0-3:3(nil, WHEN@2:0-2:13(LIST@2:5-2:6(VCALL@2:5-2:6(:a), nil), INTEGER@2:12-2:13(1), nil)))
SCOPE@1:0-3:3([], nil, CASE@1:0-3:3(VCALL@1:5-1:6(:a), WHEN@2:0-2:14(SPLAT@2:5-2:7(VCALL@2:6-2:7(:b)), INTEGER@2:13-2:14(1), nil)))
SCOPE@1:0-1:7([], nil, AND@1:0-1:7(VCALL@1:0-1:1(:a), VCALL@1:6-1:7(:b)))
SCOPE@1:0-1:6([], nil, OR@1:0-1:6(VCALL@1:0-1:1(:a), VCALL@1:5-1:6(:b)))
SCOPE@1:0-1:5([], nil, OPCALL@1:0-1:5(VCALL@1:4-1:5(:a), :!, nil))
SCOPE@1:0-1:6([], nil, AND@1:0-1:6(VCALL@1:0-1:1(:a), VCALL@1:5-1:6(:b)))
SCOPE@1:0-1:6([], nil, OR@1:0-1:6(VCALL@1:0-1:1(:a), VCALL@1:5-1:6(:b)))
SCOPE@1:0-1:11([], nil, OR@1:0-1:11(AND@1:0-1:6(VCALL@1:0-1:1(:a), VCALL@1:5-1:6(:b)), VCALL@1:10-1:11(:c)))
SCOPE@1:0-5:3([], nil, RESCUE@2:2-4:3(VCALL@2:2-2:3(:a), RESBODY@3:0-4:3(nil, nil, VCALL@4:2-4:3(:b), nil), nil))
SCOPE@1:0-11:3([:e], nil, ENSURE@2:2-10:3(RESCUE@2:2-8:3(VCALL@2:2-2:3(:a), RESBODY@3:0-6:3(LIST@3:7-3:10(CONST@3:7-3:10(:Foo), nil), LASGN@3:11-3:15(:e, ERRINFO@3:11-3:15()), VCALL@4:2-4:3(:b), RESBODY@5:0-6:3(LIST@5:7-5:15(CONST@5:7-5:10(:Bar), CONST@5:12-5:15(:Baz), nil), nil, VCALL@6:2-6:3(:c), nil)), VCALL@8:2-8:3(:d)), VCALL@10:2-10:3(:f)))
SCOPE@1:0-5:3([], nil, ENSURE@2:2-4:3(VCALL@2:2-2:3(:a), VCALL@4:2-4:3(:b)))
SCOPE@1:0-1:10([], nil, RESCUE@1:0-1:10(VCALL@1:0-1:1(:a), RESBODY@1:2-1:10(nil, nil, VCALL@1:9-1:10(:b), nil), nil))
SCOPE@1:0-2:3([], nil, BEGIN@1:5-1:5(nil))
SCOPE@1:0-3:3([], nil, WHILE@1:0-3:3(VCALL@1:6-1:7(:a), BREAK@2:2-2:7(nil), true))
SCOPE@1:0-3:3([], nil, WHILE@1:0-3:3(VCALL@1:6-1:7(:a), BREAK@2:2-2:9(INTEGER@2:8-2:9(1)), true))
SCOPE@1:0-3:3([], nil, WHILE@1:0-3:3(VCALL@1:6-1:7(:a), NEXT@2:2-2:6(nil), true))
SCOPE@1:0-3:3([], nil, WHILE@1:0-3:3(VCALL@1:6-1:7(:a), REDO@2:2-2:6(), true))
SCOPE@1:0-5:3([], nil, RESCUE@2:2-4:7(VCALL@2:2-2:3(:a), RESBODY@3:0-4:7(nil, nil, RETRY@4:2-4:7(), nil), nil))
SCOPE@1:0-1:6([], nil, RETURN@1:0-1:6(nil))
SCOPE@1:0-1:8([], nil, RETURN@1:0-1:8(INTEGER@1:7-1:8(1)))
SCOPE@1:0-1:11([], nil, RETURN@1:0-1:11(LIST@1:7-1:11(INTEGER@1:7-1:8(1), INTEGER@1:10-1:11(2), nil)))
SCOPE@1:0-3:3([:x], nil, FOR@1:0-3:3(VCALL@1:9-1:10(:a), SCOPE@1:0-3:3([nil], ARGS@1:4-1:5(1, LASGN@1:4-1:5(:x, DVAR@1:4-1:5(nil)), nil, nil, 0, nil, nil, nil, nil, nil), VCALL@2:2-2:3(:b))))
SCOPE@1:0-3:3([:a, :b], nil, FOR@1:0-3:3(VCALL@1:12-1:13(:c), SCOPE@1:0-3:3([nil], ARGS@1:4-1:8(0, MASGN@1:4-1:8(FOR_MASGN@1:4-1:8(DVAR@1:4-1:8(nil)), LIST@1:4-1:8(LASGN@1:4-1:5(:a, nil), LASGN@1:7-1:8(:b, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), VCALL@2:2-2:3(:d))))
SCOPE@1:0-1:4([], nil, DOT2@1:0-1:4(INTEGER@1:0-1:1(1), INTEGER@1:3-1:4(2)))
SCOPE@1:0-1:5([], nil, DOT3@1:0-1:5(INTEGER@1:0-1:1(1), INTEGER@1:4-1:5(2)))
SCOPE@1:0-1:5([], nil, BLOCK@1:0-1:5(DOT2@1:1-1:4(INTEGER@1:1-1:2(1), NIL@1:4-1:4())))
SCOPE@1:0-1:5([], nil, BLOCK@1:0-1:5(DOT2@1:1-1:4(NIL@1:1-1:1(), INTEGER@1:3-1:4(2))))
SCOPE@1:0-1:4([], nil, DOT2@1:0-1:4(VCALL@1:0-1:1(:a), VCALL@1:3-1:4(:b)))
SCOPE@1:0-1:32([], nil, IF@1:0-1:32(FLIP2@1:3-1:21(BLOCK@1:3-1:11(OPCALL@1:4-1:10(VCALL@1:4-1:5(:a), :==, LIST@1:9-1:10(INTEGER@1:9-1:10(1), nil))), BLOCK@1:13-1:21(OPCALL@1:14-1:20(VCALL@1:14-1:15(:a), :==, LIST@1:19-1:20(INTEGER@1:19-1:20(2), nil)))), VCALL@1:27-1:28(:x), nil))
SCOPE@1:0-1:33([], nil, IF@1:0-1:33(FLIP3@1:3-1:22(BLOCK@1:3-1:11(OPCALL@1:4-1:10(VCALL@1:4-1:5(:a), :==, LIST@1:9-1:10(INTEGER@1:9-1:10(1), nil))), BLOCK@1:14-1:22(OPCALL@1:15-1:21(VCALL@1:15-1:16(:a), :==, LIST@1:20-1:21(INTEGER@1:20-1:21(2), nil)))), VCALL@1:28-1:29(:x), nil))
SCOPE@1:0-1:26([:x], nil, LASGN@1:0-1:26(:x, IF@1:4-1:26(VCALL@1:7-1:8(:a), INTEGER@1:14-1:15(1), INTEGER@1:21-1:22(2))))
SCOPE@1:0-1:14([:a], nil, LASGN@1:0-1:14(:a, RESCUE@1:4-1:14(VCALL@1:4-1:5(:b), RESBODY@1:6-1:14(nil, nil, VCALL@1:13-1:14(:c), nil), nil)))
SyntaxError: Invalid break
SCOPE@1:0-3:3([], nil, VCALL@2:2-2:3(:a))
SCOPE@1:0-4:3([], nil, BLOCK@2:2-3:3(VCALL@2:2-2:3(:a), VCALL@3:2-3:3(:b)))
SCOPE@1:0-1:18([], nil, FOR@1:0-1:18(VCALL@1:10-1:11(:a), SCOPE@1:0-1:18([nil], ARGS@1:4-1:6(0, MASGN@1:4-1:6(DVAR@1:4-1:6(nil), LIST@1:4-1:6(IASGN@1:4-1:6(:@x, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:14-1:14(nil))))
SyntaxError: Invalid break
SCOPE@1:0-2:3([], nil, IF@1:0-2:3(VCALL@1:3-1:4(:a), BEGIN@1:4-1:4(nil), nil))
SCOPE@1:0-2:3([], nil, WHILE@1:0-2:3(VCALL@1:6-1:7(:a), BEGIN@1:7-1:7(nil), true))
SCOPE@1:0-3:3([], nil, CASE@1:0-3:3(VCALL@1:5-1:6(:a), WHEN@2:0-2:6(LIST@2:5-2:6(INTEGER@2:5-2:6(1), nil), BEGIN@2:6-2:6(nil), nil)))
SCOPE@1:0-3:3([], nil, WHILE@1:0-3:3(VCALL@1:6-1:7(:a), IF@2:2-2:17(VCALL@2:5-2:6(:b), VCALL@2:12-2:13(:c), nil), true))
SCOPE@1:0-1:17([], nil, WHILE@1:0-1:17(TRUE@1:6-1:10(), BEGIN@1:13-1:13(nil), true))
SCOPE@1:0-1:19([], nil, CASE@1:0-1:19(VCALL@1:5-1:6(:a), WHEN@1:8-1:15(LIST@1:13-1:14(INTEGER@1:13-1:14(1), nil), BEGIN@1:15-1:15(nil), nil)))
SCOPE@1:0-1:14([], nil, UNTIL@1:0-1:14(VCALL@1:6-1:7(:a), BEGIN@1:10-1:10(nil), true))
SCOPE@1:0-1:18([], nil, UNTIL@1:0-1:18(VCALL@1:17-1:18(:a), BEGIN@1:5-1:5(nil), false))
SCOPE@1:0-1:11([], nil, IF@1:0-1:11(VCALL@1:10-1:11(:a), RETURN@1:0-1:6(nil), nil))
SCOPE@1:0-1:12([], nil, AND@1:0-1:12(OR@1:0-1:6(VCALL@1:0-1:1(:a), VCALL@1:5-1:6(:b)), VCALL@1:11-1:12(:c)))
SCOPE@1:0-5:3([:e], nil, RESCUE@2:2-4:3(VCALL@2:2-2:3(:a), RESBODY@3:0-4:3(nil, LASGN@3:7-3:11(:e, ERRINFO@3:7-3:11()), LVAR@4:2-4:3(:e), nil), nil))
SCOPE@1:0-1:20([], nil, RESCUE@1:6-1:16(VCALL@1:6-1:7(:a), RESBODY@1:8-1:16(nil, nil, VCALL@1:15-1:16(:b), nil), nil))
SCOPE@1:0-1:15([:x], nil, LASGN@1:0-1:15(:x, BEGIN@1:4-1:15(INTEGER@1:10-1:11(1))))
SCOPE@1:0-1:17([], nil, IF@1:0-1:17(VCALL@1:0-1:1(:a), IF@1:4-1:13(VCALL@1:4-1:5(:b), INTEGER@1:8-1:9(1), INTEGER@1:12-1:13(2)), INTEGER@1:16-1:17(3)))
SCOPE@1:0-1:26([], nil, IF@1:0-1:26(VCALL@1:3-1:4(:a), BEGIN@1:9-1:9(nil), IF@1:10-1:22(VCALL@1:16-1:17(:b), BEGIN@1:22-1:22(nil), nil)))
SCOPE@1:0-1:13([:x], nil, IF@1:0-1:13(VCALL@1:12-1:13(:a), LASGN@1:0-1:8(:x, DOT2@1:4-1:8(INTEGER@1:4-1:5(1), INTEGER@1:7-1:8(2))), nil))
SCOPE@1:0-1:19([], nil, UNLESS@1:0-1:19(VCALL@1:7-1:8(:a), VCALL@1:14-1:15(:b), nil))
SCOPE@1:0-6:3([], nil, CASE@1:0-6:3(VCALL@1:5-1:6(:a), WHEN@2:0-5:4(LIST@2:5-2:6(INTEGER@2:5-2:6(1), nil), BLOCK@3:2-4:3(VCALL@3:2-3:3(:b), VCALL@4:2-4:3(:c)), BEGIN@5:4-5:4(nil))))
SCOPE@1:0-5:3([:b], nil, RESCUE@2:2-4:13(VCALL@2:2-2:3(:a), RESBODY@3:0-4:13(LIST@3:7-3:8(CONST@3:7-3:8(:A), nil), nil, BEGIN@3:8-3:8(nil), RESBODY@4:0-4:13(LIST@4:7-4:8(CONST@4:7-4:8(:B), nil), LASGN@4:9-4:13(:b, ERRINFO@4:9-4:13()), BEGIN@4:13-4:13(nil), nil)), nil))
SCOPE@1:0-1:24([:i], nil, FOR@1:0-1:24(DOT2@1:9-1:13(INTEGER@1:9-1:10(1), INTEGER@1:12-1:13(3)), SCOPE@1:0-1:24([nil], ARGS@1:4-1:5(1, LASGN@1:4-1:5(:i, DVAR@1:4-1:5(nil)), nil, nil, 0, nil, nil, nil, nil, nil), FCALL@1:17-1:20(:p, LIST@1:19-1:20(LVAR@1:19-1:20(:i), nil)))))
SCOPE@1:0-1:6([], nil, OPCALL@1:0-1:6(VCALL@1:4-1:5(:a), :!, nil))
SCOPE@1:0-1:4([], nil, OPCALL@1:0-1:4(CALL@1:1-1:4(VCALL@1:1-1:2(:a), :b, nil), :!, nil))
SCOPE@1:0-1:7([], nil, AND@1:0-1:7(VCALL@1:0-1:1(:a), OPCALL@1:5-1:7(VCALL@1:6-1:7(:b), :!, nil)))
SCOPE@1:0-1:18([], nil, WHILE@1:0-1:18(VCALL@1:6-1:7(:a), BLOCK@1:9-1:13(VCALL@1:9-1:10(:b), VCALL@1:12-1:13(:c)), true))
SCOPE@1:0-4:3([], nil, ENSURE@2:2-3:6(VCALL@2:2-2:3(:a), BEGIN@3:6-3:6(nil)))
SCOPE@1:0-1:12([:x], nil, LASGN@1:0-1:12(:x, BLOCK@1:4-1:12(OR@1:5-1:11(VCALL@1:5-1:6(:a), VCALL@1:10-1:11(:b)))))
SCOPE@1:0-1:21([], nil, IF@1:0-1:21(VCALL@1:3-1:4(:a), VCALL@1:6-1:7(:b), BLOCK@1:13-1:16(BEGIN@1:13-1:13(nil), VCALL@1:15-1:16(:c))))
SCOPE@1:0-1:9([], nil, IF@1:0-1:9(VCALL@1:3-1:4(:a), BEGIN@1:5-1:5(nil), nil))
SCOPE@1:0-1:12([], nil, WHILE@1:0-1:12(VCALL@1:6-1:7(:a), BEGIN@1:8-1:8(nil), true))
SCOPE@1:0-1:12([], nil, UNTIL@1:0-1:12(VCALL@1:6-1:7(:a), BEGIN@1:8-1:8(nil), true))
SCOPE@1:0-1:10([], nil, BEGIN@1:5-1:5(nil))
SCOPE@1:0-1:15([:x], nil, FOR@1:0-1:15(VCALL@1:9-1:10(:a), SCOPE@1:0-1:15([nil], ARGS@1:4-1:5(1, LASGN@1:4-1:5(:x, DVAR@1:4-1:5(nil)), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:11-1:11(nil))))
SCOPE@1:0-1:13([], nil, UNLESS@1:0-1:13(VCALL@1:7-1:8(:a), BEGIN@1:9-1:9(nil), nil))
SCOPE@1:0-1:14([], nil, IF@1:0-1:14(VCALL@1:3-1:4(:a), BEGIN@1:9-1:9(nil), nil))
SCOPE@1:0-1:13([], nil, BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)))
SCOPE@1:0-1:17([:x], nil, LASGN@1:0-1:17(:x, BEGIN@1:4-1:17(BLOCK@1:9-1:12(BEGIN@1:9-1:9(nil), VCALL@1:11-1:12(:a)))))
SCOPE@1:0-5:3([:x], nil, LASGN@1:0-5:3(:x, BEGIN@1:4-5:3(RESCUE@2:1-4:2(VCALL@2:1-2:2(:a), RESBODY@3:0-4:2(nil, nil, VCALL@4:1-4:2(:b), nil), nil))))
SCOPE@1:0-1:16([], nil, FCALL@1:0-1:16(:foo, LIST@1:4-1:15(BEGIN@1:4-1:15(INTEGER@1:10-1:11(1)), nil)))
SCOPE@1:0-1:16([], nil, CALL@1:0-1:16(BEGIN@1:0-1:11(INTEGER@1:6-1:7(1)), :to_s, nil))
SCOPE@1:0-1:13([], nil, LIST@1:0-1:13(BEGIN@1:1-1:12(INTEGER@1:7-1:8(1)), nil))
SCOPE@1:0-1:18([], nil, WHILE@1:0-1:18(VCALL@1:6-1:7(:a), BLOCK@1:10-1:13(BEGIN@1:10-1:10(nil), VCALL@1:12-1:13(:b)), true))
SCOPE@1:0-1:15([], nil, IF@1:0-1:15(VCALL@1:3-1:4(:a), BEGIN@1:5-1:5(nil), BEGIN@1:10-1:10(nil)))
SCOPE@1:0-3:3([], nil, IF@1:0-3:3(VCALL@1:3-1:4(:a), BLOCK@1:4-2:2(BEGIN@1:4-1:4(nil), VCALL@2:1-2:2(:b)), nil))
SCOPE@1:0-1:11([], nil, IF@1:0-1:11(VCALL@1:3-1:4(:a), BLOCK@1:5-1:7(BEGIN@1:5-1:5(nil), VCALL@1:6-1:7(:b)), nil))
SCOPE@1:0-2:8([], nil, IF@1:0-2:8(VCALL@1:3-1:4(:a), BLOCK@1:6-2:4(BEGIN@1:6-1:6(nil), VCALL@2:3-2:4(:b)), nil))
SCOPE@1:0-4:3([], nil, IF@1:0-4:3(VCALL@1:3-1:4(:a), VCALL@3:0-3:1(:b), nil))
SCOPE@1:0-3:3([], nil, IF@1:0-3:3(VCALL@1:3-1:4(:a), VCALL@2:0-2:1(:b), nil))
SCOPE@1:0-2:10([], nil, IF@1:0-2:10(VCALL@1:3-1:4(:a), VCALL@2:5-2:6(:b), nil))
SCOPE@1:0-1:16([], nil, IF@1:0-1:16(VCALL@1:3-1:4(:a), VCALL@1:11-1:12(:b), nil))
SCOPE@1:0-3:3([], nil, WHILE@1:0-3:3(VCALL@1:6-1:7(:a), BLOCK@1:7-2:2(BEGIN@1:7-1:7(nil), VCALL@2:1-2:2(:b)), true))
SCOPE@1:0-1:14([], nil, WHILE@1:0-1:14(VCALL@1:6-1:7(:a), BLOCK@1:8-1:10(BEGIN@1:8-1:8(nil), VCALL@1:9-1:10(:b)), true))
SCOPE@1:0-4:3([], nil, UNTIL@1:0-4:3(VCALL@1:6-1:7(:a), VCALL@3:0-3:1(:b), true))
SCOPE@1:0-3:3([:x], nil, FOR@1:0-3:3(VCALL@1:9-1:10(:a), SCOPE@1:0-3:3([nil], ARGS@1:4-1:5(1, LASGN@1:4-1:5(:x, DVAR@1:4-1:5(nil)), nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:10-2:2(BEGIN@1:10-1:10(nil), VCALL@2:1-2:2(:b)))))
SCOPE@1:0-1:16([:x], nil, FOR@1:0-1:16(VCALL@1:9-1:10(:a), SCOPE@1:0-1:16([nil], ARGS@1:4-1:5(1, LASGN@1:4-1:5(:x, DVAR@1:4-1:5(nil)), nil, nil, 0, nil, nil, nil, nil, nil), VCALL@1:11-1:12(:b))))
SCOPE@1:0-3:3([], nil, UNLESS@1:0-3:3(VCALL@1:7-1:8(:a), BLOCK@1:8-2:2(BEGIN@1:8-1:8(nil), VCALL@2:1-2:2(:b)), nil))
SCOPE@1:0-4:3([], nil, IF@1:0-4:3(VCALL@1:3-1:4(:a), BEGIN@1:4-1:4(nil), IF@2:0-3:2(VCALL@2:6-2:7(:c), BLOCK@2:7-3:2(BEGIN@2:7-2:7(nil), VCALL@3:1-3:2(:b)), nil)))
SCOPE@1:0-4:3([], nil, CASE@1:0-4:3(VCALL@1:5-1:6(:a), WHEN@2:0-3:2(LIST@2:5-2:6(INTEGER@2:5-2:6(1), nil), BLOCK@2:6-3:2(BEGIN@2:6-2:6(nil), VCALL@3:1-3:2(:b)), nil)))
SCOPE@1:0-3:3([], nil, CASE@1:0-3:3(VCALL@1:5-1:6(:a), WHEN@2:0-2:10(LIST@2:5-2:6(INTEGER@2:5-2:6(1), nil), BLOCK@2:7-2:10(BEGIN@2:7-2:7(nil), VCALL@2:9-2:10(:b)), nil)))
SCOPE@1:0-5:3([], nil, RESCUE@1:5-4:2(BLOCK@1:5-2:2(BEGIN@1:5-1:5(nil), VCALL@2:1-2:2(:a)), RESBODY@3:0-4:2(nil, nil, BLOCK@3:6-4:2(BEGIN@3:6-3:6(nil), VCALL@4:1-4:2(:b)), nil), nil))
SCOPE@1:0-1:17([], nil, WHILE@1:0-1:17(VCALL@1:6-1:7(:a), BLOCK@1:10-1:13(BEGIN@1:10-1:10(nil), VCALL@1:12-1:13(:b)), true))
SCOPE@1:0-1:26([], nil, DEFN@1:0-1:26(:foo, SCOPE@1:0-1:26([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ENSURE@1:9-1:22(INTEGER@1:9-1:10(1), BLOCK@1:18-1:21(BEGIN@1:18-1:18(nil), INTEGER@1:20-1:21(2))))))
SCOPE@1:0-1:25([], nil, DEFN@1:0-1:25(:foo, SCOPE@1:0-1:25([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ENSURE@1:9-1:21(INTEGER@1:9-1:10(1), BLOCK@1:18-1:21(BEGIN@1:18-1:18(nil), INTEGER@1:20-1:21(2))))))
SCOPE@1:0-5:3([], nil, DEFN@1:0-5:3(:foo, SCOPE@1:0-5:3([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ENSURE@2:0-4:1(INTEGER@2:0-2:1(1), INTEGER@4:0-4:1(2)))))
SCOPE@1:0-1:24([], nil, ENSURE@1:5-1:20(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), INTEGER@1:7-1:8(1)), BLOCK@1:16-1:19(BEGIN@1:16-1:16(nil), INTEGER@1:18-1:19(2))))
SCOPE@1:0-1:22([], nil, ENSURE@1:6-1:18(INTEGER@1:6-1:7(1), INTEGER@1:16-1:17(2)))
SCOPE@1:0-1:24([], nil, ITER@1:0-1:24(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:24([], nil, ENSURE@1:7-1:20(INTEGER@1:7-1:8(1), BLOCK@1:16-1:19(BEGIN@1:16-1:16(nil), INTEGER@1:18-1:19(2))))))
SCOPE@1:0-1:26([], nil, DEFN@1:0-1:26(:foo, SCOPE@1:0-1:26([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), RESCUE@1:9-1:22(INTEGER@1:9-1:10(1), RESBODY@1:12-1:22(nil, nil, INTEGER@1:20-1:21(2), nil), nil))))
SCOPE@1:0-1:46([], nil, DEFN@1:0-1:46(:foo, SCOPE@1:0-1:46([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ENSURE@1:9-1:42(RESCUE@1:9-1:30(INTEGER@1:9-1:10(1), RESBODY@1:12-1:22(nil, nil, INTEGER@1:20-1:21(2), nil), BLOCK@1:27-1:30(BEGIN@1:27-1:27(nil), INTEGER@1:29-1:30(3))), BLOCK@1:38-1:41(BEGIN@1:38-1:38(nil), INTEGER@1:40-1:41(4))))))
SCOPE@1:0-1:26([], nil, CLASS@1:0-1:26(COLON2@1:6-1:7(nil, :A), nil, SCOPE@1:0-1:26([], nil, ENSURE@1:7-1:22(BLOCK@1:7-1:10(BEGIN@1:7-1:7(nil), INTEGER@1:9-1:10(1)), BLOCK@1:18-1:21(BEGIN@1:18-1:18(nil), INTEGER@1:20-1:21(2))))))
SCOPE@1:0-1:33([], nil, DEFN@1:0-1:33(:foo, SCOPE@1:0-1:33([:*, :**, :&, :"..."], ARGS@1:8-1:11(0, nil, nil, nil, 0, nil, :*, nil, DVAR@1:8-1:11(:**), :&), BLOCK@1:12-1:28(BEGIN@1:12-1:12(nil), ITER@1:14-1:28(FCALL@1:14-1:15(:x, nil), SCOPE@1:16-1:28([], nil, FCALL@1:18-1:26(:bar, BLOCK_PASS@1:21-1:26(ARGSPUSH@1:21-1:26(SPLAT@1:22-1:25(LVAR@1:22-1:25(:*)), HASH@1:22-1:25(LIST@1:22-1:25(nil, LVAR@1:22-1:25(:**), nil))), LVAR@1:22-1:25(:&)))))))))
SCOPE@1:0-1:29([], nil, DEFN@1:0-1:29(:foo, SCOPE@1:0-1:29([:&], ARGS@1:8-1:9(0, nil, nil, nil, 0, nil, nil, nil, nil, :&), BLOCK@1:10-1:24(BEGIN@1:10-1:10(nil), ITER@1:12-1:24(FCALL@1:12-1:13(:x, nil), SCOPE@1:14-1:24([], nil, FCALL@1:16-1:22(:bar, BLOCK_PASS@1:20-1:21(nil, LVAR@1:20-1:21(:&)))))))))
SCOPE@1:0-1:39([], nil, RESCUE@1:5-1:35(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)), RESBODY@1:10-1:35(LIST@1:17-1:18(CONST@1:17-1:18(:A), nil), nil, VCALL@1:20-1:21(:b), RESBODY@1:23-1:35(LIST@1:30-1:31(CONST@1:30-1:31(:B), nil), nil, VCALL@1:33-1:34(:c), nil)), nil))
SCOPE@1:0-1:50([], nil, ENSURE@1:5-1:46(RESCUE@1:5-1:35(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)), RESBODY@1:10-1:35(LIST@1:17-1:18(CONST@1:17-1:18(:A), nil), nil, VCALL@1:20-1:21(:b), RESBODY@1:23-1:35(LIST@1:30-1:31(CONST@1:30-1:31(:B), nil), nil, VCALL@1:33-1:34(:c), nil)), nil), BLOCK@1:42-1:45(BEGIN@1:42-1:42(nil), VCALL@1:44-1:45(:d))))
SCOPE@1:0-1:25([], nil, RESCUE@1:5-1:21(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)), RESBODY@1:10-1:21(nil, nil, VCALL@1:18-1:19(:b), nil), nil))
SCOPE@1:0-1:23([], nil, RESCUE@1:5-1:19(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)), RESBODY@1:10-1:19(nil, nil, BEGIN@1:17-1:17(nil), nil), nil))
SCOPE@1:0-1:23([], nil, ENSURE@1:5-1:19(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)), BEGIN@1:16-1:16(nil)))
SCOPE@1:0-1:33([], nil, RESCUE@1:5-1:28(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)), RESBODY@1:10-1:20(nil, nil, VCALL@1:18-1:19(:b), nil), BLOCK@1:25-1:28(BEGIN@1:25-1:25(nil), VCALL@1:27-1:28(:c))))
SCOPE@1:0-5:3([], nil, RESCUE@2:0-4:2(VCALL@2:0-2:1(:a), RESBODY@3:0-4:2(nil, nil, VCALL@4:0-4:1(:b), nil), nil))
SCOPE@1:0-1:26([:e], nil, RESCUE@1:5-1:22(BLOCK@1:5-1:8(BEGIN@1:5-1:5(nil), VCALL@1:7-1:8(:a)), RESBODY@1:10-1:22(nil, LASGN@1:17-1:21(:e, ERRINFO@1:17-1:21()), BEGIN@1:22-1:22(nil), nil), nil))
SCOPE@1:0-1:24([:first], nil, FOR@1:0-1:24(VCALL@1:14-1:19(:pairs), SCOPE@1:0-1:24([nil], ARGS@1:4-1:10(0, MASGN@1:4-1:10(FOR_MASGN@1:4-1:10(DVAR@1:4-1:10(nil)), LIST@1:4-1:9(LASGN@1:4-1:9(:first, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:20-1:20(nil))))
SCOPE@1:0-1:30([], nil, FOR@1:0-1:30(LIST@1:19-1:25(INTEGER@1:20-1:21(7), INTEGER@1:23-1:24(8), nil), SCOPE@1:0-1:30([nil], ARGS@1:4-1:15(0, MASGN@1:4-1:15(DVAR@1:4-1:15(nil), LIST@1:4-1:15(ATTRASGN@1:4-1:15(VCALL@1:4-1:10(:holder), :seen=, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:26-1:26(nil))))
SCOPE@1:0-1:25([:head, :tail], nil, FOR@1:0-1:25(VCALL@1:19-1:20(:a), SCOPE@1:0-1:25([nil], ARGS@1:4-1:15(0, MASGN@1:4-1:15(FOR_MASGN@1:4-1:15(DVAR@1:4-1:15(nil)), LIST@1:4-1:8(LASGN@1:4-1:8(:head, nil), nil), LASGN@1:11-1:15(:tail, nil)), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:21-1:21(nil))))
SCOPE@1:0-1:16([], nil, FOR@1:0-1:16(VCALL@1:10-1:11(:b), SCOPE@1:0-1:16([nil], ARGS@1:4-1:6(0, MASGN@1:4-1:6(DVAR@1:4-1:6(nil), LIST@1:4-1:6(IASGN@1:4-1:6(:@a, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:12-1:12(nil))))
SCOPE@1:0-1:18([], nil, FOR@1:0-1:18(VCALL@1:12-1:13(:b), SCOPE@1:0-1:18([nil], ARGS@1:4-1:8(0, MASGN@1:4-1:8(DVAR@1:4-1:8(nil), LIST@1:4-1:8(ATTRASGN@1:4-1:8(VCALL@1:4-1:5(:a), :[]=, LIST@1:6-1:7(INTEGER@1:6-1:7(0), nil)), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:14-1:14(nil))))
```
