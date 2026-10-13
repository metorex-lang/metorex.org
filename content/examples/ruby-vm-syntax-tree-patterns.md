---
title: "ruby_vm/syntax_tree_patterns.rb"
slug: ruby-vm-syntax-tree-patterns
description: "The metorex example program ruby_vm/syntax_tree_patterns.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_patterns.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_patterns.rb).

```metorex
# RubyVM::AbstractSyntaxTree names each pattern the way MRI's parser does:
# array, find and hash patterns, alternatives, bindings, pins and guards,
# and the one-line `in` and `=>` matches.

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
  "case a; in 1; end",
  "case a; in 1 then b; end",
  "case a; in Integer => x; end",
  "case a; in [1, *r]; end",
  "case a; in [1, 2]; end",
  "case a; in []; end",
  "case a; in {x: 1}; end",
  "case a; in {x:}; end",
  "case a; in {}; end",
  "case a; in {x: 1, **r}; end",
  "case a; in {x: 1, **nil}; end",
  "case a; in [*, 1, *]; end",
  "case a; in 1 | 2; end",
  "case a; in ^b; end",
  "case a; in ^(b + 1); end",
  "case a; in x if x > 1; end",
  "case a; in x unless x; end",
  "case a; in Foo(1, 2); end",
  "case a; in Foo[x:]; end",
  "case a; in 1..; end",
  "case a; in nil; else 2; end",
  "a in Integer",
  "a => x",
  "a => [x, y]",
  "case a; in :s; end",
  "case a; in \"s\"; end",
  "case a; in /r/; end",
  "case a; in -> x { x }; end",
  "case a; in Foo::Bar; end",
  "case a; in String | Symbol => s; end",
  "case a; in x:; end",
  "case a; in 1, 2; end",
  "case a; in 1, *r; end",
  "case a; in x: 1, **r; end",
  "b = 1; case a; in ^b; end",
  "case a; in [x, *]; end",
  "case a; in [*r, 1]; end",
  "case a; in Foo[*, 1, *x]; end",
  "case a; in {x: [1, y]}; end",
  "case a; in Foo(x:); end",
  "case a; in [1] | [2]; end",
  "case a; in {x: 1} => h; end",
  "case a\nin 1\n  b\nin 2\n  c\nend",
  "case a; in 1; b; in 2; c; else; d; end",
  "foo { case a; in x; end }",
  "case a; in @b; end",
  "case a; in ^@b; end",
  "case a; in \"\#{b}\"; end",
  "x = 1; case a; in ^x; end",
  "a in [x]",
  "a => {x:}",
  "case a; in [Integer => x, String]; end",
  "case a; in {name: String => n}; end",
  "case a; in ^$g; end",
  "case a; in ^@@c; end",
  "case a; in [1, *] | []; end",
  "case a; in Foo::Bar(x:); end",
  "case a; in ::Foo[1]; end",
  "foo { |v| case v; in [x]; x; end }",
  "case a\nin [\n  1,\n  2\n]\n  b\nend",
  "case a\nin {x: 1,\n    y: 2}\n  b\nend",
  "case a; in [[1, 2], *rest]; end",
  "case a; in {x: {y: z}}; end",
  "case a; in 1.. | ..0; end",
  "case a; in String if a.size > 1 && b; end",
  "x = 1; case a; in [^x, y]; end",
  "case [1, 2]; in [a, b] then a + b; end",
  "case a; in Integer | Float => n; end",
  "case a; in [*, :x, *post]; end",
  "case a; in nil | true | false; end",
  "case a; in __FILE__; end",
  "case \"x\"; in \"x\" then 1; end",
  "case a; in {x: 1, **}; end",
  "case a; in (1 | 2); end",
  "case a; in **r; end",
  "case a; in Foo(); end",
  "case a; in x, *; end",
  "case a; in 1,; end",
  "case a; in Foo[]; end",
  "case a; in [*, [1], *]; end",
  "case a; in [*r, [1], {x:}]; end",
  "case a; in Foo([1], *); end",
  "case a; in [1], [2]; end",
  "case a; in {x: [1], y: {z:}}; end",
].freeze

SOURCES.each do |source|
  puts(dump(RubyVM::AbstractSyntaxTree.parse(source)))
rescue SyntaxError
  puts("SyntaxError")
end
```

Output:

```
SCOPE@1:0-1:17([], nil, CASE3@1:0-1:17(VCALL@1:5-1:6(:a), IN@1:8-1:13(INTEGER@1:11-1:12(1), BEGIN@1:13-1:13(nil), nil)))
SCOPE@1:0-1:24([], nil, CASE3@1:0-1:24(VCALL@1:5-1:6(:a), IN@1:8-1:20(INTEGER@1:11-1:12(1), VCALL@1:18-1:19(:b), nil)))
SCOPE@1:0-1:28([:x], nil, CASE3@1:0-1:28(VCALL@1:5-1:6(:a), IN@1:8-1:24(HASH@1:11-1:23(LIST@1:11-1:23(CONST@1:11-1:18(:Integer), LASGN@1:22-1:23(:x, nil), nil)), BEGIN@1:24-1:24(nil), nil)))
SCOPE@1:0-1:23([:r], nil, CASE3@1:0-1:23(VCALL@1:5-1:6(:a), IN@1:8-1:19(ARYPTN@1:12-1:17(nil, LIST@1:12-1:13(INTEGER@1:12-1:13(1), nil), LASGN@1:15-1:17(:r, nil), nil), BEGIN@1:19-1:19(nil), nil)))
SCOPE@1:0-1:22([], nil, CASE3@1:0-1:22(VCALL@1:5-1:6(:a), IN@1:8-1:18(ARYPTN@1:12-1:16(nil, LIST@1:12-1:16(INTEGER@1:12-1:13(1), INTEGER@1:15-1:16(2), nil), nil, nil), BEGIN@1:18-1:18(nil), nil)))
SCOPE@1:0-1:18([], nil, CASE3@1:0-1:18(VCALL@1:5-1:6(:a), IN@1:8-1:14(ARYPTN@1:11-1:13(nil, nil, nil, nil), BEGIN@1:14-1:14(nil), nil)))
SCOPE@1:0-1:22([], nil, CASE3@1:0-1:22(VCALL@1:5-1:6(:a), IN@1:8-1:18(HSHPTN@1:12-1:16(nil, HASH@1:12-1:16(LIST@1:12-1:16(SYM@1:12-1:14(:x), INTEGER@1:15-1:16(1), nil)), nil), BEGIN@1:18-1:18(nil), nil)))
SCOPE@1:0-1:20([:x], nil, CASE3@1:0-1:20(VCALL@1:5-1:6(:a), IN@1:8-1:16(HSHPTN@1:12-1:14(nil, HASH@1:12-1:14(LIST@1:12-1:14(SYM@1:12-1:14(:x), LASGN@1:12-1:14(:x, nil), nil)), nil), BEGIN@1:16-1:16(nil), nil)))
SCOPE@1:0-1:18([], nil, CASE3@1:0-1:18(VCALL@1:5-1:6(:a), IN@1:8-1:14(HSHPTN@1:11-1:13(nil, nil, nil), BEGIN@1:14-1:14(nil), nil)))
SCOPE@1:0-1:27([:r], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(HSHPTN@1:12-1:21(nil, HASH@1:12-1:21(LIST@1:12-1:16(SYM@1:12-1:14(:x), INTEGER@1:15-1:16(1), nil)), LASGN@1:12-1:21(:r, nil)), BEGIN@1:23-1:23(nil), nil)))
SCOPE@1:0-1:29([], nil, CASE3@1:0-1:29(VCALL@1:5-1:6(:a), IN@1:8-1:25(HSHPTN@1:12-1:23(nil, HASH@1:12-1:23(LIST@1:12-1:16(SYM@1:12-1:14(:x), INTEGER@1:15-1:16(1), nil)), :NODE_SPECIAL_NO_REST_KEYWORD), BEGIN@1:25-1:25(nil), nil)))
SCOPE@1:0-1:25([], nil, CASE3@1:0-1:25(VCALL@1:5-1:6(:a), IN@1:8-1:21(FNDPTN@1:12-1:19(nil, :NODE_SPECIAL_NO_NAME_REST, LIST@1:15-1:16(INTEGER@1:15-1:16(1), nil), :NODE_SPECIAL_NO_NAME_REST), BEGIN@1:21-1:21(nil), nil)))
SCOPE@1:0-1:21([], nil, CASE3@1:0-1:21(VCALL@1:5-1:6(:a), IN@1:8-1:17(OR@1:11-1:16(INTEGER@1:11-1:12(1), INTEGER@1:15-1:16(2)), BEGIN@1:17-1:17(nil), nil)))
SyntaxError
SCOPE@1:0-1:24([], nil, CASE3@1:0-1:24(VCALL@1:5-1:6(:a), IN@1:8-1:20(BLOCK@1:11-1:19(OPCALL@1:13-1:18(VCALL@1:13-1:14(:b), :+, LIST@1:17-1:18(INTEGER@1:17-1:18(1), nil))), BEGIN@1:20-1:20(nil), nil)))
SCOPE@1:0-1:26([:x], nil, CASE3@1:0-1:26(VCALL@1:5-1:6(:a), IN@1:8-1:22(IF@1:11-1:21(OPCALL@1:16-1:21(LVAR@1:16-1:17(:x), :>, LIST@1:20-1:21(INTEGER@1:20-1:21(1), nil)), LASGN@1:11-1:12(:x, nil), nil), BEGIN@1:22-1:22(nil), nil)))
SCOPE@1:0-1:26([:x], nil, CASE3@1:0-1:26(VCALL@1:5-1:6(:a), IN@1:8-1:22(UNLESS@1:11-1:21(LVAR@1:20-1:21(:x), LASGN@1:11-1:12(:x, nil), nil), BEGIN@1:22-1:22(nil), nil)))
SCOPE@1:0-1:25([], nil, CASE3@1:0-1:25(VCALL@1:5-1:6(:a), IN@1:8-1:21(ARYPTN@1:11-1:19(CONST@1:11-1:14(:Foo), LIST@1:15-1:19(INTEGER@1:15-1:16(1), INTEGER@1:18-1:19(2), nil), nil, nil), BEGIN@1:21-1:21(nil), nil)))
SCOPE@1:0-1:23([:x], nil, CASE3@1:0-1:23(VCALL@1:5-1:6(:a), IN@1:8-1:19(HSHPTN@1:11-1:17(CONST@1:11-1:14(:Foo), HASH@1:15-1:17(LIST@1:15-1:17(SYM@1:15-1:17(:x), LASGN@1:15-1:17(:x, nil), nil)), nil), BEGIN@1:19-1:19(nil), nil)))
SCOPE@1:0-1:19([], nil, CASE3@1:0-1:19(VCALL@1:5-1:6(:a), IN@1:8-1:15(DOT2@1:11-1:14(INTEGER@1:11-1:12(1), NIL@1:14-1:14()), BEGIN@1:15-1:15(nil), nil)))
SCOPE@1:0-1:27([], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(NIL@1:11-1:14(), BEGIN@1:15-1:15(nil), INTEGER@1:21-1:22(2))))
SCOPE@1:0-1:12([], nil, CASE3@1:0-1:12(VCALL@1:0-1:1(:a), IN@1:5-1:12(CONST@1:5-1:12(:Integer), TRUE@1:5-1:12(), FALSE@1:5-1:12())))
SCOPE@1:0-1:6([:x], nil, CASE3@1:0-1:6(VCALL@1:0-1:1(:a), IN@1:5-1:6(LASGN@1:5-1:6(:x, nil), nil, nil)))
SCOPE@1:0-1:11([:x, :y], nil, CASE3@1:0-1:11(VCALL@1:0-1:1(:a), IN@1:5-1:11(ARYPTN@1:6-1:10(nil, LIST@1:6-1:10(LASGN@1:6-1:7(:x, nil), LASGN@1:9-1:10(:y, nil), nil), nil, nil), nil, nil)))
SCOPE@1:0-1:18([], nil, CASE3@1:0-1:18(VCALL@1:5-1:6(:a), IN@1:8-1:14(SYM@1:11-1:13(:s), BEGIN@1:14-1:14(nil), nil)))
SCOPE@1:0-1:19([], nil, CASE3@1:0-1:19(VCALL@1:5-1:6(:a), IN@1:8-1:15(STR@1:11-1:14("s"), BEGIN@1:15-1:15(nil), nil)))
SCOPE@1:0-1:19([], nil, CASE3@1:0-1:19(VCALL@1:5-1:6(:a), IN@1:8-1:15(REGX@1:11-1:14(/r/), BEGIN@1:15-1:15(nil), nil)))
SCOPE@1:0-1:26([], nil, CASE3@1:0-1:26(VCALL@1:5-1:6(:a), IN@1:8-1:22(LAMBDA@1:11-1:21(SCOPE@1:14-1:21([:x], ARGS@1:14-1:15(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:18-1:19(:x))), BEGIN@1:22-1:22(nil), nil)))
SCOPE@1:0-1:24([], nil, CASE3@1:0-1:24(VCALL@1:5-1:6(:a), IN@1:8-1:20(COLON2@1:11-1:19(CONST@1:11-1:14(:Foo), :Bar), BEGIN@1:20-1:20(nil), nil)))
SCOPE@1:0-1:36([:s], nil, CASE3@1:0-1:36(VCALL@1:5-1:6(:a), IN@1:8-1:32(HASH@1:11-1:31(LIST@1:11-1:31(OR@1:11-1:26(CONST@1:11-1:17(:String), CONST@1:20-1:26(:Symbol)), LASGN@1:30-1:31(:s, nil), nil)), BEGIN@1:32-1:32(nil), nil)))
SCOPE@1:0-1:18([:x], nil, CASE3@1:0-1:18(VCALL@1:5-1:6(:a), IN@1:8-1:14(HSHPTN@1:11-1:13(nil, HASH@1:11-1:13(LIST@1:11-1:13(SYM@1:11-1:13(:x), LASGN@1:11-1:13(:x, nil), nil)), nil), BEGIN@1:14-1:14(nil), nil)))
SCOPE@1:0-1:20([], nil, CASE3@1:0-1:20(VCALL@1:5-1:6(:a), IN@1:8-1:16(ARYPTN@1:11-1:15(nil, LIST@1:11-1:15(INTEGER@1:11-1:12(1), INTEGER@1:14-1:15(2), nil), nil, nil), BEGIN@1:16-1:16(nil), nil)))
SCOPE@1:0-1:21([:r], nil, CASE3@1:0-1:21(VCALL@1:5-1:6(:a), IN@1:8-1:17(ARYPTN@1:11-1:16(nil, LIST@1:11-1:16(INTEGER@1:11-1:12(1), nil), LASGN@1:14-1:16(:r, nil), nil), BEGIN@1:17-1:17(nil), nil)))
SCOPE@1:0-1:25([:r], nil, CASE3@1:0-1:25(VCALL@1:5-1:6(:a), IN@1:8-1:21(HSHPTN@1:11-1:20(nil, HASH@1:11-1:20(LIST@1:11-1:15(SYM@1:11-1:13(:x), INTEGER@1:14-1:15(1), nil)), LASGN@1:11-1:20(:r, nil)), BEGIN@1:21-1:21(nil), nil)))
SCOPE@1:0-1:25([:b], nil, BLOCK@1:0-1:25(LASGN@1:0-1:5(:b, INTEGER@1:4-1:5(1)), CASE3@1:7-1:25(VCALL@1:12-1:13(:a), IN@1:15-1:21(LVAR@1:18-1:20(:b), BEGIN@1:21-1:21(nil), nil))))
SCOPE@1:0-1:22([:x], nil, CASE3@1:0-1:22(VCALL@1:5-1:6(:a), IN@1:8-1:18(ARYPTN@1:12-1:16(nil, LIST@1:12-1:13(LASGN@1:12-1:13(:x, nil), nil), :NODE_SPECIAL_NO_NAME_REST, nil), BEGIN@1:18-1:18(nil), nil)))
SCOPE@1:0-1:23([:r], nil, CASE3@1:0-1:23(VCALL@1:5-1:6(:a), IN@1:8-1:19(ARYPTN@1:12-1:17(nil, nil, LASGN@1:12-1:14(:r, nil), LIST@1:16-1:17(INTEGER@1:16-1:17(1), nil)), BEGIN@1:19-1:19(nil), nil)))
SCOPE@1:0-1:29([:x], nil, CASE3@1:0-1:29(VCALL@1:5-1:6(:a), IN@1:8-1:25(FNDPTN@1:11-1:23(CONST@1:11-1:14(:Foo), :NODE_SPECIAL_NO_NAME_REST, LIST@1:18-1:19(INTEGER@1:18-1:19(1), nil), LASGN@1:21-1:23(:x, nil)), BEGIN@1:25-1:25(nil), nil)))
SCOPE@1:0-1:27([:y], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(HSHPTN@1:12-1:21(nil, HASH@1:12-1:21(LIST@1:12-1:20(SYM@1:12-1:14(:x), ARYPTN@1:16-1:20(nil, LIST@1:16-1:20(INTEGER@1:16-1:17(1), LASGN@1:19-1:20(:y, nil), nil), nil, nil), nil)), nil), BEGIN@1:23-1:23(nil), nil)))
SCOPE@1:0-1:23([:x], nil, CASE3@1:0-1:23(VCALL@1:5-1:6(:a), IN@1:8-1:19(HSHPTN@1:11-1:17(CONST@1:11-1:14(:Foo), HASH@1:15-1:17(LIST@1:15-1:17(SYM@1:15-1:17(:x), LASGN@1:15-1:17(:x, nil), nil)), nil), BEGIN@1:19-1:19(nil), nil)))
SCOPE@1:0-1:25([], nil, CASE3@1:0-1:25(VCALL@1:5-1:6(:a), IN@1:8-1:21(OR@1:11-1:20(ARYPTN@1:12-1:13(nil, LIST@1:12-1:13(INTEGER@1:12-1:13(1), nil), nil, nil), ARYPTN@1:18-1:19(nil, LIST@1:18-1:19(INTEGER@1:18-1:19(2), nil), nil, nil)), BEGIN@1:21-1:21(nil), nil)))
SCOPE@1:0-1:27([:h], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(HASH@1:11-1:22(LIST@1:11-1:22(HSHPTN@1:12-1:16(nil, HASH@1:12-1:16(LIST@1:12-1:16(SYM@1:12-1:14(:x), INTEGER@1:15-1:16(1), nil)), nil), LASGN@1:21-1:22(:h, nil), nil)), BEGIN@1:23-1:23(nil), nil)))
SCOPE@1:0-6:3([], nil, CASE3@1:0-6:3(VCALL@1:5-1:6(:a), IN@2:0-5:3(INTEGER@2:3-2:4(1), VCALL@3:2-3:3(:b), IN@4:0-5:3(INTEGER@4:3-4:4(2), VCALL@5:2-5:3(:c), nil))))
SCOPE@1:0-1:38([], nil, CASE3@1:0-1:38(VCALL@1:5-1:6(:a), IN@1:8-1:34(INTEGER@1:11-1:12(1), VCALL@1:14-1:15(:b), IN@1:17-1:34(INTEGER@1:20-1:21(2), VCALL@1:23-1:24(:c), BLOCK@1:30-1:33(BEGIN@1:30-1:30(nil), VCALL@1:32-1:33(:d))))))
SCOPE@1:0-1:25([], nil, ITER@1:0-1:25(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:25([:x], nil, CASE3@1:6-1:23(VCALL@1:11-1:12(:a), IN@1:14-1:19(DASGN@1:17-1:18(:x, nil), BEGIN@1:19-1:19(nil), nil)))))
SyntaxError
SCOPE@1:0-1:19([], nil, CASE3@1:0-1:19(VCALL@1:5-1:6(:a), IN@1:8-1:15(IVAR@1:11-1:14(:@b), BEGIN@1:15-1:15(nil), nil)))
SCOPE@1:0-1:22([], nil, CASE3@1:0-1:22(VCALL@1:5-1:6(:a), IN@1:8-1:18(DSTR@1:11-1:17("", EVSTR@1:11-1:17(VCALL@1:14-1:15(:b)), nil), BEGIN@1:18-1:18(nil), nil)))
SCOPE@1:0-1:25([:x], nil, BLOCK@1:0-1:25(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), CASE3@1:7-1:25(VCALL@1:12-1:13(:a), IN@1:15-1:21(LVAR@1:18-1:20(:x), BEGIN@1:21-1:21(nil), nil))))
SCOPE@1:0-1:8([:x], nil, CASE3@1:0-1:8(VCALL@1:0-1:1(:a), IN@1:5-1:8(ARYPTN@1:6-1:7(nil, LIST@1:6-1:7(LASGN@1:6-1:7(:x, nil), nil), nil, nil), TRUE@1:5-1:8(), FALSE@1:5-1:8())))
SCOPE@1:0-1:9([:x], nil, CASE3@1:0-1:9(VCALL@1:0-1:1(:a), IN@1:5-1:9(HSHPTN@1:6-1:8(nil, HASH@1:6-1:8(LIST@1:6-1:8(SYM@1:6-1:8(:x), LASGN@1:6-1:8(:x, nil), nil)), nil), nil, nil)))
SCOPE@1:0-1:38([:x], nil, CASE3@1:0-1:38(VCALL@1:5-1:6(:a), IN@1:8-1:34(ARYPTN@1:12-1:32(nil, LIST@1:12-1:32(HASH@1:12-1:24(LIST@1:12-1:24(CONST@1:12-1:19(:Integer), LASGN@1:23-1:24(:x, nil), nil)), CONST@1:26-1:32(:String), nil), nil, nil), BEGIN@1:34-1:34(nil), nil)))
SCOPE@1:0-1:35([:n], nil, CASE3@1:0-1:35(VCALL@1:5-1:6(:a), IN@1:8-1:31(HSHPTN@1:12-1:29(nil, HASH@1:12-1:29(LIST@1:12-1:29(SYM@1:12-1:17(:name), HASH@1:18-1:29(LIST@1:18-1:29(CONST@1:18-1:24(:String), LASGN@1:28-1:29(:n, nil), nil)), nil)), nil), BEGIN@1:31-1:31(nil), nil)))
SCOPE@1:0-1:19([], nil, CASE3@1:0-1:19(VCALL@1:5-1:6(:a), IN@1:8-1:15(GVAR@1:11-1:14(:$g), BEGIN@1:15-1:15(nil), nil)))
SCOPE@1:0-1:20([], nil, CASE3@1:0-1:20(VCALL@1:5-1:6(:a), IN@1:8-1:16(CVAR@1:11-1:15(:@@c), BEGIN@1:16-1:16(nil), nil)))
SCOPE@1:0-1:27([], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(OR@1:11-1:22(ARYPTN@1:12-1:16(nil, LIST@1:12-1:13(INTEGER@1:12-1:13(1), nil), :NODE_SPECIAL_NO_NAME_REST, nil), ARYPTN@1:20-1:22(nil, nil, nil, nil)), BEGIN@1:23-1:23(nil), nil)))
SCOPE@1:0-1:28([:x], nil, CASE3@1:0-1:28(VCALL@1:5-1:6(:a), IN@1:8-1:24(HSHPTN@1:11-1:22(COLON2@1:11-1:19(CONST@1:11-1:14(:Foo), :Bar), HASH@1:20-1:22(LIST@1:20-1:22(SYM@1:20-1:22(:x), LASGN@1:20-1:22(:x, nil), nil)), nil), BEGIN@1:24-1:24(nil), nil)))
SCOPE@1:0-1:24([], nil, CASE3@1:0-1:24(VCALL@1:5-1:6(:a), IN@1:8-1:20(ARYPTN@1:11-1:18(COLON3@1:11-1:16(:Foo), LIST@1:17-1:18(INTEGER@1:17-1:18(1), nil), nil, nil), BEGIN@1:20-1:20(nil), nil)))
SCOPE@1:0-1:34([], nil, ITER@1:0-1:34(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:34([:v, :x], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), CASE3@1:10-1:32(DVAR@1:15-1:16(:v), IN@1:18-1:28(ARYPTN@1:22-1:23(nil, LIST@1:22-1:23(DASGN@1:22-1:23(:x, nil), nil), nil, nil), DVAR@1:26-1:27(:x), nil)))))
SCOPE@1:0-7:3([], nil, CASE3@1:0-7:3(VCALL@1:5-1:6(:a), IN@2:0-6:3(ARYPTN@3:2-4:3(nil, LIST@3:2-4:3(INTEGER@3:2-3:3(1), INTEGER@4:2-4:3(2), nil), nil, nil), VCALL@6:2-6:3(:b), nil)))
SCOPE@1:0-5:3([], nil, CASE3@1:0-5:3(VCALL@1:5-1:6(:a), IN@2:0-4:3(HSHPTN@2:4-3:8(nil, HASH@2:4-3:8(LIST@2:4-3:8(SYM@2:4-2:6(:x), INTEGER@2:7-2:8(1), SYM@3:4-3:6(:y), INTEGER@3:7-3:8(2), nil)), nil), VCALL@4:2-4:3(:b), nil)))
SCOPE@1:0-1:31([:rest], nil, CASE3@1:0-1:31(VCALL@1:5-1:6(:a), IN@1:8-1:27(ARYPTN@1:12-1:25(nil, LIST@1:12-1:18(ARYPTN@1:13-1:17(nil, LIST@1:13-1:17(INTEGER@1:13-1:14(1), INTEGER@1:16-1:17(2), nil), nil, nil), nil), LASGN@1:20-1:25(:rest, nil), nil), BEGIN@1:27-1:27(nil), nil)))
SCOPE@1:0-1:27([:z], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(HSHPTN@1:12-1:21(nil, HASH@1:12-1:21(LIST@1:12-1:20(SYM@1:12-1:14(:x), HSHPTN@1:16-1:20(nil, HASH@1:16-1:20(LIST@1:16-1:20(SYM@1:16-1:18(:y), LASGN@1:19-1:20(:z, nil), nil)), nil), nil)), nil), BEGIN@1:23-1:23(nil), nil)))
SCOPE@1:0-1:25([], nil, CASE3@1:0-1:25(VCALL@1:5-1:6(:a), IN@1:8-1:21(OR@1:11-1:20(DOT2@1:11-1:14(INTEGER@1:11-1:12(1), NIL@1:14-1:14()), DOT2@1:17-1:20(NIL@1:17-1:17(), INTEGER@1:19-1:20(0))), BEGIN@1:21-1:21(nil), nil)))
SCOPE@1:0-1:41([], nil, CASE3@1:0-1:41(VCALL@1:5-1:6(:a), IN@1:8-1:37(IF@1:11-1:36(AND@1:21-1:36(OPCALL@1:21-1:31(CALL@1:21-1:27(VCALL@1:21-1:22(:a), :size, nil), :>, LIST@1:30-1:31(INTEGER@1:30-1:31(1), nil)), VCALL@1:35-1:36(:b)), CONST@1:11-1:17(:String), nil), BEGIN@1:37-1:37(nil), nil)))
SCOPE@1:0-1:30([:x, :y], nil, BLOCK@1:0-1:30(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), CASE3@1:7-1:30(VCALL@1:12-1:13(:a), IN@1:15-1:26(ARYPTN@1:19-1:24(nil, LIST@1:19-1:24(LVAR@1:19-1:21(:x), LASGN@1:23-1:24(:y, nil), nil), nil, nil), BEGIN@1:26-1:26(nil), nil))))
SCOPE@1:0-1:38([:a, :b], nil, CASE3@1:0-1:38(LIST@1:5-1:11(INTEGER@1:6-1:7(1), INTEGER@1:9-1:10(2), nil), IN@1:13-1:34(ARYPTN@1:17-1:21(nil, LIST@1:17-1:21(LASGN@1:17-1:18(:a, nil), LASGN@1:20-1:21(:b, nil), nil), nil, nil), OPCALL@1:28-1:33(LVAR@1:28-1:29(:a), :+, LIST@1:32-1:33(LVAR@1:32-1:33(:b), nil)), nil)))
SCOPE@1:0-1:36([:n], nil, CASE3@1:0-1:36(VCALL@1:5-1:6(:a), IN@1:8-1:32(HASH@1:11-1:31(LIST@1:11-1:31(OR@1:11-1:26(CONST@1:11-1:18(:Integer), CONST@1:21-1:26(:Float)), LASGN@1:30-1:31(:n, nil), nil)), BEGIN@1:32-1:32(nil), nil)))
SCOPE@1:0-1:30([:post], nil, CASE3@1:0-1:30(VCALL@1:5-1:6(:a), IN@1:8-1:26(FNDPTN@1:12-1:24(nil, :NODE_SPECIAL_NO_NAME_REST, LIST@1:15-1:17(SYM@1:15-1:17(:x), nil), LASGN@1:19-1:24(:post, nil)), BEGIN@1:26-1:26(nil), nil)))
SCOPE@1:0-1:34([], nil, CASE3@1:0-1:34(VCALL@1:5-1:6(:a), IN@1:8-1:30(OR@1:11-1:29(OR@1:11-1:21(NIL@1:11-1:14(), TRUE@1:17-1:21()), FALSE@1:24-1:29()), BEGIN@1:30-1:30(nil), nil)))
SCOPE@1:0-1:24([], nil, CASE3@1:0-1:24(VCALL@1:5-1:6(:a), IN@1:8-1:20(FILE@1:11-1:19(""), BEGIN@1:20-1:20(nil), nil)))
SCOPE@1:0-1:28([], nil, CASE3@1:0-1:28(STR@1:5-1:8("x"), IN@1:10-1:24(STR@1:13-1:16("x"), INTEGER@1:22-1:23(1), nil)))
SCOPE@1:0-1:26([], nil, CASE3@1:0-1:26(VCALL@1:5-1:6(:a), IN@1:8-1:22(HSHPTN@1:12-1:20(nil, HASH@1:12-1:20(LIST@1:12-1:16(SYM@1:12-1:14(:x), INTEGER@1:15-1:16(1), nil)), nil), BEGIN@1:22-1:22(nil), nil)))
SCOPE@1:0-1:23([], nil, CASE3@1:0-1:23(VCALL@1:5-1:6(:a), IN@1:8-1:19(OR@1:12-1:17(INTEGER@1:12-1:13(1), INTEGER@1:16-1:17(2)), BEGIN@1:19-1:19(nil), nil)))
SCOPE@1:0-1:19([:r], nil, CASE3@1:0-1:19(VCALL@1:5-1:6(:a), IN@1:8-1:15(HSHPTN@1:11-1:14(nil, HASH@1:11-1:14(nil), LASGN@1:11-1:14(:r, nil)), BEGIN@1:15-1:15(nil), nil)))
SCOPE@1:0-1:21([], nil, CASE3@1:0-1:21(VCALL@1:5-1:6(:a), IN@1:8-1:17(ARYPTN@1:11-1:16(CONST@1:11-1:14(:Foo), nil, nil, nil), BEGIN@1:17-1:17(nil), nil)))
SCOPE@1:0-1:20([:x], nil, CASE3@1:0-1:20(VCALL@1:5-1:6(:a), IN@1:8-1:16(ARYPTN@1:11-1:15(nil, LIST@1:11-1:15(LASGN@1:11-1:12(:x, nil), nil), :NODE_SPECIAL_NO_NAME_REST, nil), BEGIN@1:16-1:16(nil), nil)))
SCOPE@1:0-1:18([], nil, CASE3@1:0-1:18(VCALL@1:5-1:6(:a), IN@1:8-1:14(ARYPTN@1:11-1:13(nil, LIST@1:11-1:13(INTEGER@1:11-1:12(1), nil), :NODE_SPECIAL_NO_NAME_REST, nil), BEGIN@1:14-1:14(nil), nil)))
SCOPE@1:0-1:21([], nil, CASE3@1:0-1:21(VCALL@1:5-1:6(:a), IN@1:8-1:17(ARYPTN@1:11-1:16(CONST@1:11-1:14(:Foo), nil, nil, nil), BEGIN@1:17-1:17(nil), nil)))
SCOPE@1:0-1:27([], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(FNDPTN@1:12-1:21(nil, :NODE_SPECIAL_NO_NAME_REST, LIST@1:15-1:18(ARYPTN@1:16-1:17(nil, LIST@1:16-1:17(INTEGER@1:16-1:17(1), nil), nil, nil), nil), :NODE_SPECIAL_NO_NAME_REST), BEGIN@1:23-1:23(nil), nil)))
SCOPE@1:0-1:31([:r, :x], nil, CASE3@1:0-1:31(VCALL@1:5-1:6(:a), IN@1:8-1:27(ARYPTN@1:12-1:25(nil, nil, LASGN@1:12-1:14(:r, nil), LIST@1:16-1:25(ARYPTN@1:17-1:18(nil, LIST@1:17-1:18(INTEGER@1:17-1:18(1), nil), nil, nil), HSHPTN@1:22-1:24(nil, HASH@1:22-1:24(LIST@1:22-1:24(SYM@1:22-1:24(:x), LASGN@1:22-1:24(:x, nil), nil)), nil), nil)), BEGIN@1:27-1:27(nil), nil)))
SCOPE@1:0-1:27([], nil, CASE3@1:0-1:27(VCALL@1:5-1:6(:a), IN@1:8-1:23(ARYPTN@1:11-1:21(CONST@1:11-1:14(:Foo), LIST@1:15-1:18(ARYPTN@1:16-1:17(nil, LIST@1:16-1:17(INTEGER@1:16-1:17(1), nil), nil, nil), nil), :NODE_SPECIAL_NO_NAME_REST, nil), BEGIN@1:23-1:23(nil), nil)))
SCOPE@1:0-1:24([], nil, CASE3@1:0-1:24(VCALL@1:5-1:6(:a), IN@1:8-1:20(ARYPTN@1:11-1:19(nil, LIST@1:11-1:19(ARYPTN@1:12-1:13(nil, LIST@1:12-1:13(INTEGER@1:12-1:13(1), nil), nil, nil), ARYPTN@1:17-1:18(nil, LIST@1:17-1:18(INTEGER@1:17-1:18(2), nil), nil, nil), nil), nil, nil), BEGIN@1:20-1:20(nil), nil)))
SCOPE@1:0-1:33([:z], nil, CASE3@1:0-1:33(VCALL@1:5-1:6(:a), IN@1:8-1:29(HSHPTN@1:12-1:27(nil, HASH@1:12-1:27(LIST@1:12-1:26(SYM@1:12-1:14(:x), ARYPTN@1:16-1:17(nil, LIST@1:16-1:17(INTEGER@1:16-1:17(1), nil), nil, nil), SYM@1:20-1:22(:y), HSHPTN@1:24-1:26(nil, HASH@1:24-1:26(LIST@1:24-1:26(SYM@1:24-1:26(:z), LASGN@1:24-1:26(:z, nil), nil)), nil), nil)), nil), BEGIN@1:29-1:29(nil), nil)))
```
