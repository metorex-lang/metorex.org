---
title: "ruby_vm/syntax_tree_definitions.rb"
slug: ruby-vm-syntax-tree-definitions
description: "The metorex example program ruby_vm/syntax_tree_definitions.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_definitions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_definitions.rb){target=_blank rel=noopener}.

```metorex
# RubyVM::AbstractSyntaxTree names each method, class, module, block and
# lambda the way MRI's parser does: the parameters each declares, the locals
# its body reads, and whether a local belongs to a block.

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
  "def foo; end",
  "def foo\nend",
  "def foo; 1; end",
  "def foo(a); a; end",
  "def foo a, b\n a\nend",
  "def foo(a, b = 1); end",
  "def foo(*r); end",
  "def foo(a, *r, b); end",
  "def foo(**k); end",
  "def foo(&b); end",
  "def foo(a:, b: 1); end",
  "def foo(a, b = 2, *c, d, e:, f: 3, **g, &h); end",
  "def foo(...); bar(...); end",
  "def foo(*); bar(*); end",
  "def foo(**); bar(**); end",
  "def foo(&); bar(&); end",
  "def foo(**nil); end",
  "def foo((a, b)); end",
  "def self.foo; end",
  "def a.foo(x); x; end",
  "def foo = 1",
  "def foo(a) = a + 1",
  "def ==(o); end",
  "def foo; rescue; end",
  "def foo; 1; ensure; 2; end",
  "class Foo; end",
  "class Foo < Bar; end",
  "class Foo::Bar; end",
  "class ::Foo; end",
  "class Foo\n def a; end\nend",
  "module M; end",
  "module M\n X = 1\nend",
  "class << self; end",
  "class << a; def b; end; end",
  "foo { }",
  "foo { 1 }",
  "foo { |x| x }",
  "foo do |a, b| a end",
  "foo(1) { |x| }",
  "a.each { |x, (y, z)| }",
  "foo { |*a, **k, &b| }",
  "foo { |a = 1| }",
  "foo { |a; b| }",
  "foo { it }",
  "foo { _1 + _2 }",
  "-> { }",
  "->(x) { x }",
  "-> x do x end",
  "lambda { |x| x }",
  "foo &b",
  "a.b { 1 }",
  "a.b do end",
  "foo bar { 1 }",
  "foo bar do 1 end",
  "def foo; yield; end",
  "def foo; yield 1, 2; end",
  "def foo(x); yield(x); end",
  "def foo; super; end",
  "def foo; super(); end",
  "def foo; super 1; end",
  "def foo; super(1, &b); end",
  "alias foo bar",
  "alias :foo :bar",
  "alias $a $b",
  "undef foo",
  "undef foo, bar",
  "defined?(a)",
  "defined? @a",
  "defined?(Foo)",
  "defined?(yield)",
  "def foo; defined?(super); end",
  "a = 1; foo { a }",
  "foo { |x| x = 1 }",
  "1.times { |i| p i }",
  "proc { |x| next x }",
  "loop { break 1 }",
  "def foo; return 1; end",
  "foo(&:bar)",
  "foo(1, &nil)",
  "x = ->(a, b = 1) { a }",
  "def foo(a); bar { a }; end",
  "def foo; a = 1; bar { a; b = 2; b }; end",
  "foo { a = 1; bar { a } }",
  "x = 1; -> { x }",
  "foo { |a| bar { |b| a + b } }",
  "class Foo; a = 1; a; end",
  "a = 1; foo { a = 2 }",
  "a = 1; def foo; a; end",
  "foo { |x| }; x = 1; x",
  "foo { a = 1 }; a",
  "def foo(a, (b, *c), d); end",
  "foo { |a, | }",
  "foo { |(a, b)| }",
  "foo { |a, b = 1, *c, d, e:, **f, &g| }",
  "foo { || }",
  "def foo(*, **, &); end",
  "-> (a; b) { }",
  "foo { |**nil| }",
  "def foo(a = 1, b = a); end",
  "def foo a = 1\nend",
  "def foo(a, b: a); end",
  "def foo(...); bar(1, ...); end",
  "def foo(*, &); bar 1, *, &; end",
  "def foo(a, ...); bar(a, ...); end",
  "def foo(**); bar(a: 1, **); end",
  "def foo(*); x { bar(*) }; end",
  "def foo(); end",
  "a, *b = c",
  "def foo(a, (b, c), (d, e)); end",
  "foo { |(a, *b), c| }",
  "->() { }",
  "def foo((a, b)) = a",
  "def foo() = 1",
  "def self.foo = 1",
  "def foo(a) a end",
  "def foo(a)\n  a\nend",
  "def foo(a, b)\n  a + b\nend",
  "def foo(a, *b, **c, &d)\n  bar(*b, **c, &d)\nend",
  "class Foo < Struct.new(:a)\n  def b; a; end\nend",
  "class Foo::Bar < ::Baz; end",
  "module A::B; end",
  "class << self\n  attr_reader :a\nend",
  "foo.each_with_index do |(a, b), i|\n  p a, b, i\nend",
  "items.map { |item| item * 2 }",
  "items.each_slice(2).map(&:sum)",
  "items.inject(0) { |sum, n| sum + n }",
  "[1, 2].each do |x|\n  next if x.odd?\n  p x\nend",
  "foo { |a, (b, c), *d| }",
  "foo { |a:, b: 2, **c| }",
  "foo { |&b| }",
  "-> (a, b = 1, *c, d:, &e) { }",
  "->(x) do x end",
  "x = lambda do |y| y end",
  "def foo\n  yield 1\nrescue A => e\n  e\nelse\n  2\nensure\n  3\nend",
  "def foo; super(&blk); end",
  "def foo(*); super; end",
  "def method_missing(name, *args, &block)\n  super\nend",
  "alias_method :a, :b",
  "alias + -",
  "undef :a, b",
  "defined?(@a) && @a",
  "defined? foo.bar",
  "defined?(String)",
  "foo(&blk)",
  "def foo(a = {}, b = []); end",
  "proc { |a, b| [a, b] }.call(1, 2)",
  "foo do\nend",
  "foo do |x|\nend",
  "foo { |x|\n x }",
  "def foo(a, b = a, *c, d, e: d, **f, &g); [a, b, c, d, e, f, g]; end",
  "class A\n  class B\n    def c; end\n  end\nend",
  "module M\n  def self.a = 1\nend",
  "def foo(x) = bar x",
  "foo { _1 }",
  "foo { _2 }",
  "foo { it + it }",
  "foo { |it| it }",
  "foo { bar { it } }",
  "def foo = (1; 2)",
  "def a.b = 1",
  "foo bar, baz do end",
  "foo.bar baz do end",
  "a = proc { |x; y| y = x }",
  "x = 1; { x: }",
  "{ x: }",
  "foo(x:)",
  "def foo(x); bar(x:, y: 1); end",
  "[*super()]",
  "[*foo]",
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
  "p(a.b 1)",
  "p(bar [2])",
  "p(gather ())",
  "p(a.b 1, 2)",
  "foo do end&.bar do end",
  "p((foo 1 do end))",
  "a.b 1 do end",
  "a&.b 1 do end",
  "foo (1)",
  "foo (1; 2)",
  "foo ()",
  "foo (1), 2",
  "foo ((1))",
  "foo do end.bar(2) { }",
  "foo do end.bar 1 do end",
  "-> { -> { 2 } }",
  "-> { -> { 2 }; 3 }",
  "-> do -> do 2 end end",
  "foo -> { 1 }",
  "-> { x { 1 } }",
  "-> (a) { -> { a } }",
].freeze

SOURCES.each do |source|
  puts(dump(RubyVM::AbstractSyntaxTree.parse(source)))
rescue SyntaxError => error
  puts("SyntaxError: #{error.message.lines.first.chomp}")
end
```

Output:

```
SCOPE@1:0-1:12([], nil, DEFN@1:0-1:12(:foo, SCOPE@1:0-1:12([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-2:3([], nil, DEFN@1:0-2:3(:foo, SCOPE@1:0-2:3([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:15([], nil, DEFN@1:0-1:15(:foo, SCOPE@1:0-1:15([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:9-1:10(1))))
SCOPE@1:0-1:18([], nil, DEFN@1:0-1:18(:foo, SCOPE@1:0-1:18([:a], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:10-1:13(BEGIN@1:10-1:10(nil), LVAR@1:12-1:13(:a)))))
SCOPE@1:0-3:3([], nil, DEFN@1:0-3:3(:foo, SCOPE@1:0-3:3([:a, :b], ARGS@1:8-1:12(2, nil, nil, nil, 0, nil, nil, nil, nil, nil), LVAR@2:1-2:2(:a))))
SCOPE@1:0-1:22([], nil, DEFN@1:0-1:22(:foo, SCOPE@1:0-1:22([:a, :b], ARGS@1:8-1:16(1, nil, OPT_ARG@1:11-1:16(LASGN@1:11-1:16(:b, INTEGER@1:15-1:16(1)), nil), nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:16([], nil, DEFN@1:0-1:16(:foo, SCOPE@1:0-1:16([:r], ARGS@1:8-1:10(0, nil, nil, nil, 0, nil, :r, nil, nil, nil), nil)))
SCOPE@1:0-1:22([], nil, DEFN@1:0-1:22(:foo, SCOPE@1:0-1:22([:a, :r, :b], ARGS@1:8-1:16(1, nil, nil, :b, 1, nil, :r, nil, nil, nil), nil)))
SCOPE@1:0-1:17([], nil, DEFN@1:0-1:17(:foo, SCOPE@1:0-1:17([:k], ARGS@1:8-1:11(0, nil, nil, nil, 0, nil, nil, nil, DVAR@1:8-1:11(:k), nil), nil)))
SCOPE@1:0-1:16([], nil, DEFN@1:0-1:16(:foo, SCOPE@1:0-1:16([:b], ARGS@1:8-1:10(0, nil, nil, nil, 0, nil, nil, nil, nil, :b), nil)))
SCOPE@1:0-1:22([], nil, DEFN@1:0-1:22(:foo, SCOPE@1:0-1:22([:a, :b, nil], ARGS@1:8-1:16(0, nil, nil, nil, 0, nil, nil, KW_ARG@1:8-1:16(LASGN@1:8-1:10(:a, :NODE_SPECIAL_REQUIRED_KEYWORD), KW_ARG@1:12-1:16(LASGN@1:12-1:16(:b, INTEGER@1:15-1:16(1)), nil)), DVAR@1:8-1:16(nil), nil), nil)))
SCOPE@1:0-1:48([], nil, DEFN@1:0-1:48(:foo, SCOPE@1:0-1:48([:a, :b, :c, :d, :e, :f, nil, :g, :h], ARGS@1:8-1:42(1, nil, OPT_ARG@1:11-1:16(LASGN@1:11-1:16(:b, INTEGER@1:15-1:16(2)), nil), :d, 1, nil, :c, KW_ARG@1:25-1:33(LASGN@1:25-1:27(:e, :NODE_SPECIAL_REQUIRED_KEYWORD), KW_ARG@1:29-1:33(LASGN@1:29-1:33(:f, INTEGER@1:32-1:33(3)), nil)), DVAR@1:35-1:38(:g), :h), nil)))
SCOPE@1:0-1:27([], nil, DEFN@1:0-1:27(:foo, SCOPE@1:0-1:27([:*, :**, :&, :"..."], ARGS@1:8-1:11(0, nil, nil, nil, 0, nil, :*, nil, DVAR@1:8-1:11(:**), :&), BLOCK@1:12-1:22(BEGIN@1:12-1:12(nil), FCALL@1:14-1:22(:bar, BLOCK_PASS@1:17-1:22(ARGSPUSH@1:17-1:22(SPLAT@1:18-1:21(LVAR@1:18-1:21(:*)), HASH@1:18-1:21(LIST@1:18-1:21(nil, LVAR@1:18-1:21(:**), nil))), LVAR@1:18-1:21(:&)))))))
SCOPE@1:0-1:23([], nil, DEFN@1:0-1:23(:foo, SCOPE@1:0-1:23([:*], ARGS@1:8-1:9(0, nil, nil, nil, 0, nil, :*, nil, nil, nil), BLOCK@1:10-1:18(BEGIN@1:10-1:10(nil), FCALL@1:12-1:18(:bar, SPLAT@1:16-1:17(LVAR@1:16-1:17(:*)))))))
SCOPE@1:0-1:25([], nil, DEFN@1:0-1:25(:foo, SCOPE@1:0-1:25([:**], ARGS@1:8-1:10(0, nil, nil, nil, 0, nil, nil, nil, DVAR@1:8-1:10(:**), nil), BLOCK@1:11-1:20(BEGIN@1:11-1:11(nil), FCALL@1:13-1:20(:bar, LIST@1:17-1:19(HASH@1:17-1:19(LIST@1:17-1:19(nil, LVAR@1:17-1:19(:**), nil)), nil))))))
SCOPE@1:0-1:23([], nil, DEFN@1:0-1:23(:foo, SCOPE@1:0-1:23([:&], ARGS@1:8-1:9(0, nil, nil, nil, 0, nil, nil, nil, nil, :&), BLOCK@1:10-1:18(BEGIN@1:10-1:10(nil), FCALL@1:12-1:18(:bar, BLOCK_PASS@1:16-1:17(nil, LVAR@1:16-1:17(:&)))))))
SCOPE@1:0-1:19([], nil, DEFN@1:0-1:19(:foo, SCOPE@1:0-1:19([], ARGS@1:8-1:13(0, nil, nil, nil, 0, nil, nil, false, false, nil), nil)))
SCOPE@1:0-1:20([], nil, DEFN@1:0-1:20(:foo, SCOPE@1:0-1:20([nil, :a, :b], ARGS@1:8-1:14(1, MASGN@1:9-1:13(LVAR@1:9-1:9(nil), LIST@1:9-1:13(LASGN@1:9-1:10(:a, nil), LASGN@1:12-1:13(:b, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:17([], nil, DEFS@1:0-1:17(SELF@1:4-1:8(), :foo, SCOPE@1:0-1:17([], ARGS@1:12-1:12(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:20([], nil, DEFS@1:0-1:20(VCALL@1:4-1:5(:a), :foo, SCOPE@1:0-1:20([:x], ARGS@1:10-1:11(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:12-1:15(BEGIN@1:12-1:12(nil), LVAR@1:14-1:15(:x)))))
SCOPE@1:0-1:11([], nil, DEFN@1:0-1:11(:foo, SCOPE@1:0-1:11([], ARGS@1:0-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:10-1:11(1))))
SCOPE@1:0-1:18([], nil, DEFN@1:0-1:18(:foo, SCOPE@1:0-1:18([:a], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), OPCALL@1:13-1:18(LVAR@1:13-1:14(:a), :+, LIST@1:17-1:18(INTEGER@1:17-1:18(1), nil)))))
SCOPE@1:0-1:14([], nil, DEFN@1:0-1:14(:==, SCOPE@1:0-1:14([:o], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:20([], nil, DEFN@1:0-1:20(:foo, SCOPE@1:0-1:20([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), RESCUE@1:8-1:16(nil, RESBODY@1:9-1:16(nil, nil, BEGIN@1:16-1:16(nil), nil), nil))))
SCOPE@1:0-1:26([], nil, DEFN@1:0-1:26(:foo, SCOPE@1:0-1:26([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ENSURE@1:9-1:22(INTEGER@1:9-1:10(1), BLOCK@1:18-1:21(BEGIN@1:18-1:18(nil), INTEGER@1:20-1:21(2))))))
SCOPE@1:0-1:14([], nil, CLASS@1:0-1:14(COLON2@1:6-1:9(nil, :Foo), nil, SCOPE@1:0-1:14([], nil, BEGIN@1:9-1:9(nil))))
SCOPE@1:0-1:20([], nil, CLASS@1:0-1:20(COLON2@1:6-1:9(nil, :Foo), CONST@1:12-1:15(:Bar), SCOPE@1:0-1:20([], nil, BEGIN@1:16-1:16(nil))))
SCOPE@1:0-1:19([], nil, CLASS@1:0-1:19(COLON2@1:6-1:14(CONST@1:6-1:9(:Foo), :Bar), nil, SCOPE@1:0-1:19([], nil, BEGIN@1:14-1:14(nil))))
SCOPE@1:0-1:16([], nil, CLASS@1:0-1:16(COLON3@1:6-1:11(:Foo), nil, SCOPE@1:0-1:16([], nil, BEGIN@1:11-1:11(nil))))
SCOPE@1:0-3:3([], nil, CLASS@1:0-3:3(COLON2@1:6-1:9(nil, :Foo), nil, SCOPE@1:0-3:3([], nil, BLOCK@1:9-2:11(BEGIN@1:9-1:9(nil), DEFN@2:1-2:11(:a, SCOPE@2:1-2:11([], ARGS@2:6-2:6(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil))))))
SCOPE@1:0-1:13([], nil, MODULE@1:0-1:13(COLON2@1:7-1:8(nil, :M), SCOPE@1:0-1:13([], nil, BEGIN@1:8-1:8(nil))))
SCOPE@1:0-3:3([], nil, MODULE@1:0-3:3(COLON2@1:7-1:8(nil, :M), SCOPE@1:0-3:3([], nil, BLOCK@1:8-2:6(BEGIN@1:8-1:8(nil), CDECL@2:1-2:6(:X, INTEGER@2:5-2:6(1))))))
SCOPE@1:0-1:18([], nil, SCLASS@1:0-1:18(SELF@1:9-1:13(), SCOPE@1:0-1:18([], nil, BEGIN@1:14-1:14(nil))))
SCOPE@1:0-1:27([], nil, SCLASS@1:0-1:27(VCALL@1:9-1:10(:a), SCOPE@1:0-1:27([], nil, DEFN@1:12-1:22(:b, SCOPE@1:12-1:22([], ARGS@1:17-1:17(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil)))))
SCOPE@1:0-1:7([], nil, ITER@1:0-1:7(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:7([], nil, BEGIN@1:5-1:5(nil))))
SCOPE@1:0-1:9([], nil, ITER@1:0-1:9(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:9([], nil, INTEGER@1:6-1:7(1))))
SCOPE@1:0-1:13([], nil, ITER@1:0-1:13(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:13([:x], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:10-1:11(:x))))
SCOPE@1:0-1:19([], nil, ITER@1:0-1:19(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:19([:a, :b], ARGS@1:8-1:12(2, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:14-1:15(:a))))
SCOPE@1:0-1:14([], nil, ITER@1:0-1:14(FCALL@1:0-1:6(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:7-1:14([:x], ARGS@1:10-1:11(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:12-1:12(nil))))
SCOPE@1:0-1:22([], nil, ITER@1:0-1:22(CALL@1:0-1:6(VCALL@1:0-1:1(:a), :each, nil), SCOPE@1:7-1:22([:x, nil, :y, :z], ARGS@1:10-1:19(2, MASGN@1:14-1:18(DVAR@1:14-1:14(nil), LIST@1:14-1:18(DASGN@1:14-1:15(:y, nil), DASGN@1:17-1:18(:z, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:20-1:20(nil))))
SCOPE@1:0-1:21([], nil, ITER@1:0-1:21(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:21([:a, :k, :b], ARGS@1:7-1:18(0, nil, nil, nil, 0, nil, :a, nil, DVAR@1:11-1:14(:k), :b), BEGIN@1:19-1:19(nil))))
SCOPE@1:0-1:15([], nil, ITER@1:0-1:15(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:15([:a], ARGS@1:7-1:12(0, nil, OPT_ARG@1:7-1:12(DASGN@1:7-1:12(:a, INTEGER@1:11-1:12(1)), nil), nil, 0, nil, nil, nil, nil, nil), BEGIN@1:13-1:13(nil))))
SCOPE@1:0-1:14([], nil, ITER@1:0-1:14(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:14([:a, :b], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:12-1:12(nil))))
SCOPE@1:0-1:10([], nil, ITER@1:0-1:10(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:10([:"<it>"], ARGS@1:10-1:10(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:6-1:8(:"<it>"))))
SCOPE@1:0-1:15([], nil, ITER@1:0-1:15(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:15([:_1, :_2], ARGS@1:15-1:15(2, nil, nil, nil, 0, nil, nil, nil, nil, nil), OPCALL@1:6-1:13(DVAR@1:6-1:8(:_1), :+, LIST@1:11-1:13(DVAR@1:11-1:13(:_2), nil)))))
SCOPE@1:0-1:6([], nil, LAMBDA@1:0-1:6(SCOPE@1:2-1:6([], ARGS@1:2-1:2(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:4-1:4(nil))))
SCOPE@1:0-1:11([], nil, LAMBDA@1:0-1:11(SCOPE@1:2-1:11([:x], ARGS@1:3-1:4(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:8-1:9(:x))))
SCOPE@1:0-1:13([], nil, LAMBDA@1:0-1:13(SCOPE@1:3-1:13([:x], ARGS@1:3-1:4(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:8-1:9(:x))))
SCOPE@1:0-1:16([], nil, ITER@1:0-1:16(FCALL@1:0-1:6(:lambda, nil), SCOPE@1:7-1:16([:x], ARGS@1:10-1:11(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:13-1:14(:x))))
SCOPE@1:0-1:6([], nil, FCALL@1:0-1:6(:foo, BLOCK_PASS@1:4-1:6(nil, VCALL@1:5-1:6(:b))))
SCOPE@1:0-1:9([], nil, ITER@1:0-1:9(CALL@1:0-1:3(VCALL@1:0-1:1(:a), :b, nil), SCOPE@1:4-1:9([], nil, INTEGER@1:6-1:7(1))))
SCOPE@1:0-1:10([], nil, ITER@1:0-1:10(CALL@1:0-1:3(VCALL@1:0-1:1(:a), :b, nil), SCOPE@1:4-1:10([], nil, BEGIN@1:6-1:6(nil))))
SCOPE@1:0-1:13([], nil, FCALL@1:0-1:13(:foo, LIST@1:4-1:13(ITER@1:4-1:13(FCALL@1:4-1:7(:bar, nil), SCOPE@1:8-1:13([], nil, INTEGER@1:10-1:11(1))), nil)))
SCOPE@1:0-1:16([], nil, ITER@1:0-1:16(FCALL@1:0-1:7(:foo, LIST@1:4-1:7(VCALL@1:4-1:7(:bar), nil)), SCOPE@1:8-1:16([], nil, INTEGER@1:11-1:12(1))))
SCOPE@1:0-1:19([], nil, DEFN@1:0-1:19(:foo, SCOPE@1:0-1:19([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), YIELD@1:9-1:14(nil))))
SCOPE@1:0-1:24([], nil, DEFN@1:0-1:24(:foo, SCOPE@1:0-1:24([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), YIELD@1:9-1:19(LIST@1:15-1:19(INTEGER@1:15-1:16(1), INTEGER@1:18-1:19(2), nil)))))
SCOPE@1:0-1:25([], nil, DEFN@1:0-1:25(:foo, SCOPE@1:0-1:25([:x], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:10-1:20(BEGIN@1:10-1:10(nil), YIELD@1:12-1:20(LIST@1:18-1:19(LVAR@1:18-1:19(:x), nil))))))
SCOPE@1:0-1:19([], nil, DEFN@1:0-1:19(:foo, SCOPE@1:0-1:19([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ZSUPER@1:9-1:14())))
SCOPE@1:0-1:21([], nil, DEFN@1:0-1:21(:foo, SCOPE@1:0-1:21([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), SUPER@1:9-1:16(nil))))
SCOPE@1:0-1:21([], nil, DEFN@1:0-1:21(:foo, SCOPE@1:0-1:21([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), SUPER@1:9-1:16(LIST@1:15-1:16(INTEGER@1:15-1:16(1), nil)))))
SCOPE@1:0-1:26([], nil, DEFN@1:0-1:26(:foo, SCOPE@1:0-1:26([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), SUPER@1:9-1:21(BLOCK_PASS@1:15-1:20(LIST@1:15-1:16(INTEGER@1:15-1:16(1), nil), VCALL@1:19-1:20(:b))))))
SCOPE@1:0-1:13([], nil, ALIAS@1:0-1:13(SYM@1:6-1:9(:foo), SYM@1:10-1:13(:bar)))
SCOPE@1:0-1:15([], nil, ALIAS@1:0-1:15(SYM@1:6-1:10(:foo), SYM@1:11-1:15(:bar)))
SCOPE@1:0-1:11([], nil, VALIAS@1:0-1:11(:$a, :$b))
SCOPE@1:0-1:9([], nil, UNDEF@1:0-1:9([SYM@1:6-1:9(:foo)]))
SCOPE@1:0-1:14([], nil, UNDEF@1:0-1:14([SYM@1:6-1:9(:foo), SYM@1:11-1:14(:bar)]))
SCOPE@1:0-1:11([], nil, DEFINED@1:0-1:11(VCALL@1:9-1:10(:a)))
SCOPE@1:0-1:11([], nil, DEFINED@1:0-1:11(IVAR@1:9-1:11(:@a)))
SCOPE@1:0-1:13([], nil, DEFINED@1:0-1:13(CONST@1:9-1:12(:Foo)))
SCOPE@1:0-1:15([], nil, DEFINED@1:0-1:15(YIELD@1:9-1:14(nil)))
SCOPE@1:0-1:29([], nil, DEFN@1:0-1:29(:foo, SCOPE@1:0-1:29([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), DEFINED@1:9-1:24(ZSUPER@1:18-1:23()))))
SCOPE@1:0-1:16([:a], nil, BLOCK@1:0-1:16(LASGN@1:0-1:5(:a, INTEGER@1:4-1:5(1)), ITER@1:7-1:16(FCALL@1:7-1:10(:foo, nil), SCOPE@1:11-1:16([], nil, DVAR@1:13-1:14(:a)))))
SCOPE@1:0-1:17([], nil, ITER@1:0-1:17(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:17([:x], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DASGN@1:10-1:15(:x, INTEGER@1:14-1:15(1)))))
SCOPE@1:0-1:19([], nil, ITER@1:0-1:19(CALL@1:0-1:7(INTEGER@1:0-1:1(1), :times, nil), SCOPE@1:8-1:19([:i], ARGS@1:11-1:12(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), FCALL@1:14-1:17(:p, LIST@1:16-1:17(DVAR@1:16-1:17(:i), nil)))))
SCOPE@1:0-1:19([], nil, ITER@1:0-1:19(FCALL@1:0-1:4(:proc, nil), SCOPE@1:5-1:19([:x], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), NEXT@1:11-1:17(DVAR@1:16-1:17(:x)))))
SCOPE@1:0-1:16([], nil, ITER@1:0-1:16(FCALL@1:0-1:4(:loop, nil), SCOPE@1:5-1:16([], nil, BREAK@1:7-1:14(INTEGER@1:13-1:14(1)))))
SCOPE@1:0-1:22([], nil, DEFN@1:0-1:22(:foo, SCOPE@1:0-1:22([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), RETURN@1:9-1:17(INTEGER@1:16-1:17(1)))))
SCOPE@1:0-1:10([], nil, FCALL@1:0-1:10(:foo, BLOCK_PASS@1:4-1:9(nil, SYM@1:5-1:9(:bar))))
SCOPE@1:0-1:12([], nil, FCALL@1:0-1:12(:foo, BLOCK_PASS@1:4-1:11(LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil), NIL@1:8-1:11())))
SCOPE@1:0-1:22([:x], nil, LASGN@1:0-1:22(:x, LAMBDA@1:4-1:22(SCOPE@1:6-1:22([:a, :b], ARGS@1:7-1:15(1, nil, OPT_ARG@1:10-1:15(DASGN@1:10-1:15(:b, INTEGER@1:14-1:15(1)), nil), nil, 0, nil, nil, nil, nil, nil), DVAR@1:19-1:20(:a)))))
SCOPE@1:0-1:26([], nil, DEFN@1:0-1:26(:foo, SCOPE@1:0-1:26([:a], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:10-1:21(BEGIN@1:10-1:10(nil), ITER@1:12-1:21(FCALL@1:12-1:15(:bar, nil), SCOPE@1:16-1:21([], nil, DVAR@1:18-1:19(:a)))))))
SCOPE@1:0-1:40([], nil, DEFN@1:0-1:40(:foo, SCOPE@1:0-1:40([:a], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:9-1:35(LASGN@1:9-1:14(:a, INTEGER@1:13-1:14(1)), ITER@1:16-1:35(FCALL@1:16-1:19(:bar, nil), SCOPE@1:20-1:35([:b], nil, BLOCK@1:22-1:33(DVAR@1:22-1:23(:a), DASGN@1:25-1:30(:b, INTEGER@1:29-1:30(2)), DVAR@1:32-1:33(:b))))))))
SCOPE@1:0-1:24([], nil, ITER@1:0-1:24(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:24([:a], nil, BLOCK@1:6-1:22(DASGN@1:6-1:11(:a, INTEGER@1:10-1:11(1)), ITER@1:13-1:22(FCALL@1:13-1:16(:bar, nil), SCOPE@1:17-1:22([], nil, DVAR@1:19-1:20(:a)))))))
SCOPE@1:0-1:15([:x], nil, BLOCK@1:0-1:15(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), LAMBDA@1:7-1:15(SCOPE@1:9-1:15([], ARGS@1:9-1:9(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:12-1:13(:x)))))
SCOPE@1:0-1:29([], nil, ITER@1:0-1:29(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:29([:a], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), ITER@1:10-1:27(FCALL@1:10-1:13(:bar, nil), SCOPE@1:14-1:27([:b], ARGS@1:17-1:18(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), OPCALL@1:20-1:25(DVAR@1:20-1:21(:a), :+, LIST@1:24-1:25(DVAR@1:24-1:25(:b), nil)))))))
SCOPE@1:0-1:24([], nil, CLASS@1:0-1:24(COLON2@1:6-1:9(nil, :Foo), nil, SCOPE@1:0-1:24([:a], nil, BLOCK@1:9-1:19(BEGIN@1:9-1:9(nil), LASGN@1:11-1:16(:a, INTEGER@1:15-1:16(1)), LVAR@1:18-1:19(:a)))))
SCOPE@1:0-1:20([:a], nil, BLOCK@1:0-1:20(LASGN@1:0-1:5(:a, INTEGER@1:4-1:5(1)), ITER@1:7-1:20(FCALL@1:7-1:10(:foo, nil), SCOPE@1:11-1:20([], nil, DASGN@1:13-1:18(:a, INTEGER@1:17-1:18(2))))))
SCOPE@1:0-1:22([:a], nil, BLOCK@1:0-1:22(LASGN@1:0-1:5(:a, INTEGER@1:4-1:5(1)), DEFN@1:7-1:22(:foo, SCOPE@1:7-1:22([], ARGS@1:14-1:14(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), VCALL@1:16-1:17(:a)))))
SCOPE@1:0-1:21([:x], nil, BLOCK@1:0-1:21(ITER@1:0-1:11(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:11([:x], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:9-1:9(nil))), LASGN@1:13-1:18(:x, INTEGER@1:17-1:18(1)), LVAR@1:20-1:21(:x)))
SCOPE@1:0-1:16([], nil, BLOCK@1:0-1:16(ITER@1:0-1:13(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:13([:a], nil, DASGN@1:6-1:11(:a, INTEGER@1:10-1:11(1)))), VCALL@1:15-1:16(:a)))
SCOPE@1:0-1:27([], nil, DEFN@1:0-1:27(:foo, SCOPE@1:0-1:27([:a, nil, :d, :b, :c], ARGS@1:8-1:21(3, MASGN@1:12-1:17(LVAR@1:12-1:12(nil), LIST@1:12-1:13(LASGN@1:12-1:13(:b, nil), nil), LASGN@1:15-1:17(:c, nil)), nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:13([], nil, ITER@1:0-1:13(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:13([:a], ARGS@1:7-1:9(1, nil, nil, nil, 0, nil, :NODE_SPECIAL_EXCESSIVE_COMMA, nil, nil, nil), BEGIN@1:11-1:11(nil))))
SCOPE@1:0-1:16([], nil, ITER@1:0-1:16(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:16([nil, :a, :b], ARGS@1:7-1:13(1, MASGN@1:8-1:12(DVAR@1:8-1:8(nil), LIST@1:8-1:12(DASGN@1:8-1:9(:a, nil), DASGN@1:11-1:12(:b, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:14-1:14(nil))))
SCOPE@1:0-1:38([], nil, ITER@1:0-1:38(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:38([:a, :b, :c, :d, :e, nil, :f, :g], ARGS@1:7-1:35(1, nil, OPT_ARG@1:10-1:15(DASGN@1:10-1:15(:b, INTEGER@1:14-1:15(1)), nil), :d, 1, nil, :c, KW_ARG@1:24-1:26(DASGN@1:24-1:26(:e, :NODE_SPECIAL_REQUIRED_KEYWORD), nil), DVAR@1:28-1:31(:f), :g), BEGIN@1:36-1:36(nil))))
SCOPE@1:0-1:10([], nil, ITER@1:0-1:10(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:10([], nil, BEGIN@1:8-1:8(nil))))
SCOPE@1:0-1:22([], nil, DEFN@1:0-1:22(:foo, SCOPE@1:0-1:22([:*, :**, :&], ARGS@1:8-1:16(0, nil, nil, nil, 0, nil, :*, nil, DVAR@1:11-1:13(:**), :&), nil)))
SCOPE@1:0-1:13([], nil, LAMBDA@1:0-1:13(SCOPE@1:3-1:13([:a, :b], ARGS@1:4-1:5(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:11-1:11(nil))))
SCOPE@1:0-1:15([], nil, ITER@1:0-1:15(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:15([], ARGS@1:7-1:12(0, nil, nil, nil, 0, nil, nil, false, false, nil), BEGIN@1:13-1:13(nil))))
SCOPE@1:0-1:26([], nil, DEFN@1:0-1:26(:foo, SCOPE@1:0-1:26([:a, :b], ARGS@1:8-1:20(0, nil, OPT_ARG@1:8-1:20(LASGN@1:8-1:13(:a, INTEGER@1:12-1:13(1)), OPT_ARG@1:15-1:20(LASGN@1:15-1:20(:b, LVAR@1:19-1:20(:a)), nil)), nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-2:3([], nil, DEFN@1:0-2:3(:foo, SCOPE@1:0-2:3([:a], ARGS@1:8-1:13(0, nil, OPT_ARG@1:8-1:13(LASGN@1:8-1:13(:a, INTEGER@1:12-1:13(1)), nil), nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:21([], nil, DEFN@1:0-1:21(:foo, SCOPE@1:0-1:21([:a, :b, nil], ARGS@1:8-1:15(1, nil, nil, nil, 0, nil, nil, KW_ARG@1:11-1:15(LASGN@1:11-1:15(:b, LVAR@1:14-1:15(:a)), nil), DVAR@1:11-1:15(nil), nil), nil)))
SCOPE@1:0-1:30([], nil, DEFN@1:0-1:30(:foo, SCOPE@1:0-1:30([:*, :**, :&, :"..."], ARGS@1:8-1:11(0, nil, nil, nil, 0, nil, :*, nil, DVAR@1:8-1:11(:**), :&), BLOCK@1:12-1:25(BEGIN@1:12-1:12(nil), FCALL@1:14-1:25(:bar, BLOCK_PASS@1:17-1:25(ARGSPUSH@1:17-1:25(ARGSCAT@1:17-1:25(LIST@1:18-1:19(INTEGER@1:18-1:19(1), nil), LVAR@1:21-1:24(:*)), HASH@1:21-1:24(LIST@1:21-1:24(nil, LVAR@1:21-1:24(:**), nil))), LVAR@1:21-1:24(:&)))))))
SCOPE@1:0-1:31([], nil, DEFN@1:0-1:31(:foo, SCOPE@1:0-1:31([:*, :&], ARGS@1:8-1:12(0, nil, nil, nil, 0, nil, :*, nil, nil, :&), BLOCK@1:13-1:26(BEGIN@1:13-1:13(nil), FCALL@1:15-1:26(:bar, BLOCK_PASS@1:19-1:26(ARGSCAT@1:19-1:23(LIST@1:19-1:20(INTEGER@1:19-1:20(1), nil), LVAR@1:22-1:23(:*)), LVAR@1:25-1:26(:&)))))))
SCOPE@1:0-1:33([], nil, DEFN@1:0-1:33(:foo, SCOPE@1:0-1:33([:a, :*, :**, :&, :"..."], ARGS@1:8-1:14(1, nil, nil, nil, 0, nil, :*, nil, DVAR@1:11-1:14(:**), :&), BLOCK@1:15-1:28(BEGIN@1:15-1:15(nil), FCALL@1:17-1:28(:bar, BLOCK_PASS@1:20-1:28(ARGSPUSH@1:20-1:28(ARGSCAT@1:20-1:28(LIST@1:21-1:22(LVAR@1:21-1:22(:a), nil), LVAR@1:24-1:27(:*)), HASH@1:24-1:27(LIST@1:24-1:27(nil, LVAR@1:24-1:27(:**), nil))), LVAR@1:24-1:27(:&)))))))
SCOPE@1:0-1:31([], nil, DEFN@1:0-1:31(:foo, SCOPE@1:0-1:31([:**], ARGS@1:8-1:10(0, nil, nil, nil, 0, nil, nil, nil, DVAR@1:8-1:10(:**), nil), BLOCK@1:11-1:26(BEGIN@1:11-1:11(nil), FCALL@1:13-1:26(:bar, LIST@1:17-1:25(HASH@1:17-1:25(LIST@1:17-1:25(SYM@1:17-1:19(:a), INTEGER@1:20-1:21(1), nil, LVAR@1:23-1:25(:**), nil)), nil))))))
SCOPE@1:0-1:29([], nil, DEFN@1:0-1:29(:foo, SCOPE@1:0-1:29([:*], ARGS@1:8-1:9(0, nil, nil, nil, 0, nil, :*, nil, nil, nil), BLOCK@1:10-1:24(BEGIN@1:10-1:10(nil), ITER@1:12-1:24(FCALL@1:12-1:13(:x, nil), SCOPE@1:14-1:24([], nil, FCALL@1:16-1:22(:bar, SPLAT@1:20-1:21(LVAR@1:20-1:21(:*)))))))))
SCOPE@1:0-1:14([], nil, DEFN@1:0-1:14(:foo, SCOPE@1:0-1:14([], ARGS@1:7-1:8(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:9([:a, :b], nil, MASGN@1:0-1:9(VCALL@1:8-1:9(:c), LIST@1:0-1:1(LASGN@1:0-1:1(:a, nil), nil), LASGN@1:4-1:5(:b, nil)))
SCOPE@1:0-1:31([], nil, DEFN@1:0-1:31(:foo, SCOPE@1:0-1:31([:a, nil, nil, :b, :c, :d, :e], ARGS@1:8-1:25(3, BLOCK@1:12-1:24(MASGN@1:12-1:16(LVAR@1:12-1:12(nil), LIST@1:12-1:16(LASGN@1:12-1:13(:b, nil), LASGN@1:15-1:16(:c, nil), nil), nil), MASGN@1:20-1:24(LVAR@1:20-1:20(nil), LIST@1:20-1:24(LASGN@1:20-1:21(:d, nil), LASGN@1:23-1:24(:e, nil), nil), nil)), nil, nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:20([], nil, ITER@1:0-1:20(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:20([nil, :c, :a, :b], ARGS@1:7-1:17(2, MASGN@1:8-1:13(DVAR@1:8-1:8(nil), LIST@1:8-1:9(DASGN@1:8-1:9(:a, nil), nil), DASGN@1:11-1:13(:b, nil)), nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:18-1:18(nil))))
SCOPE@1:0-1:8([], nil, LAMBDA@1:0-1:8(SCOPE@1:2-1:8([], ARGS@1:2-1:3(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:6-1:6(nil))))
SCOPE@1:0-1:19([], nil, DEFN@1:0-1:19(:foo, SCOPE@1:0-1:19([nil, :a, :b], ARGS@1:8-1:14(1, MASGN@1:9-1:13(LVAR@1:9-1:9(nil), LIST@1:9-1:13(LASGN@1:9-1:10(:a, nil), LASGN@1:12-1:13(:b, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), LVAR@1:18-1:19(:a))))
SCOPE@1:0-1:13([], nil, DEFN@1:0-1:13(:foo, SCOPE@1:0-1:13([], ARGS@1:7-1:8(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:12-1:13(1))))
SCOPE@1:0-1:16([], nil, DEFS@1:0-1:16(SELF@1:4-1:8(), :foo, SCOPE@1:0-1:16([], ARGS@1:0-1:12(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:15-1:16(1))))
SCOPE@1:0-1:16([], nil, DEFN@1:0-1:16(:foo, SCOPE@1:0-1:16([:a], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), LVAR@1:11-1:12(:a))))
SCOPE@1:0-3:3([], nil, DEFN@1:0-3:3(:foo, SCOPE@1:0-3:3([:a], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), LVAR@2:2-2:3(:a))))
SCOPE@1:0-3:3([], nil, DEFN@1:0-3:3(:foo, SCOPE@1:0-3:3([:a, :b], ARGS@1:8-1:12(2, nil, nil, nil, 0, nil, nil, nil, nil, nil), OPCALL@2:2-2:7(LVAR@2:2-2:3(:a), :+, LIST@2:6-2:7(LVAR@2:6-2:7(:b), nil)))))
SCOPE@1:0-3:3([], nil, DEFN@1:0-3:3(:foo, SCOPE@1:0-3:3([:a, :b, :c, :d], ARGS@1:8-1:22(1, nil, nil, nil, 0, nil, :b, nil, DVAR@1:15-1:18(:c), :d), FCALL@2:2-2:18(:bar, BLOCK_PASS@2:6-2:17(ARGSPUSH@2:6-2:17(SPLAT@2:6-2:8(LVAR@2:7-2:8(:b)), HASH@2:10-2:13(LIST@2:10-2:13(nil, LVAR@2:12-2:13(:c), nil))), LVAR@2:16-2:17(:d))))))
SCOPE@1:0-3:3([], nil, CLASS@1:0-3:3(COLON2@1:6-1:9(nil, :Foo), CALL@1:12-1:26(CONST@1:12-1:18(:Struct), :new, LIST@1:23-1:25(SYM@1:23-1:25(:a), nil)), SCOPE@1:0-3:3([], nil, DEFN@2:2-2:15(:b, SCOPE@2:2-2:15([], ARGS@2:7-2:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), VCALL@2:9-2:10(:a))))))
SCOPE@1:0-1:27([], nil, CLASS@1:0-1:27(COLON2@1:6-1:14(CONST@1:6-1:9(:Foo), :Bar), COLON3@1:17-1:22(:Baz), SCOPE@1:0-1:27([], nil, BEGIN@1:23-1:23(nil))))
SCOPE@1:0-1:16([], nil, MODULE@1:0-1:16(COLON2@1:7-1:11(CONST@1:7-1:8(:A), :B), SCOPE@1:0-1:16([], nil, BEGIN@1:11-1:11(nil))))
SCOPE@1:0-3:3([], nil, SCLASS@1:0-3:3(SELF@1:9-1:13(), SCOPE@1:0-3:3([], nil, FCALL@2:2-2:16(:attr_reader, LIST@2:14-2:16(SYM@2:14-2:16(:a), nil)))))
SCOPE@1:0-3:3([], nil, ITER@1:0-3:3(CALL@1:0-1:19(VCALL@1:0-1:3(:foo), :each_with_index, nil), SCOPE@1:20-3:3([nil, :i, :a, :b], ARGS@1:24-1:33(2, MASGN@1:25-1:29(DVAR@1:25-1:25(nil), LIST@1:25-1:29(DASGN@1:25-1:26(:a, nil), DASGN@1:28-1:29(:b, nil), nil), nil), nil, nil, 0, nil, nil, nil, nil, nil), FCALL@2:2-2:11(:p, LIST@2:4-2:11(DVAR@2:4-2:5(:a), DVAR@2:7-2:8(:b), DVAR@2:10-2:11(:i), nil)))))
SCOPE@1:0-1:29([], nil, ITER@1:0-1:29(CALL@1:0-1:9(VCALL@1:0-1:5(:items), :map, nil), SCOPE@1:10-1:29([:item], ARGS@1:13-1:17(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), OPCALL@1:19-1:27(DVAR@1:19-1:23(:item), :*, LIST@1:26-1:27(INTEGER@1:26-1:27(2), nil)))))
SCOPE@1:0-1:30([], nil, CALL@1:0-1:30(CALL@1:0-1:19(VCALL@1:0-1:5(:items), :each_slice, LIST@1:17-1:18(INTEGER@1:17-1:18(2), nil)), :map, BLOCK_PASS@1:24-1:29(nil, SYM@1:25-1:29(:sum))))
SCOPE@1:0-1:36([], nil, ITER@1:0-1:36(CALL@1:0-1:15(VCALL@1:0-1:5(:items), :inject, LIST@1:13-1:14(INTEGER@1:13-1:14(0), nil)), SCOPE@1:16-1:36([:sum, :n], ARGS@1:19-1:25(2, nil, nil, nil, 0, nil, nil, nil, nil, nil), OPCALL@1:27-1:34(DVAR@1:27-1:30(:sum), :+, LIST@1:33-1:34(DVAR@1:33-1:34(:n), nil)))))
SCOPE@1:0-4:3([], nil, ITER@1:0-4:3(CALL@1:0-1:11(LIST@1:0-1:6(INTEGER@1:1-1:2(1), INTEGER@1:4-1:5(2), nil), :each, nil), SCOPE@1:12-4:3([:x], ARGS@1:16-1:17(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@2:2-3:5(IF@2:2-2:16(CALL@2:10-2:16(DVAR@2:10-2:11(:x), :odd?, nil), NEXT@2:2-2:6(nil), nil), FCALL@3:2-3:5(:p, LIST@3:4-3:5(DVAR@3:4-3:5(:x), nil))))))
SCOPE@1:0-1:23([], nil, ITER@1:0-1:23(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:23([:a, nil, :d, :b, :c], ARGS@1:7-1:20(2, MASGN@1:11-1:15(DVAR@1:11-1:11(nil), LIST@1:11-1:15(DASGN@1:11-1:12(:b, nil), DASGN@1:14-1:15(:c, nil), nil), nil), nil, nil, 0, nil, :d, nil, nil, nil), BEGIN@1:21-1:21(nil))))
SCOPE@1:0-1:23([], nil, ITER@1:0-1:23(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:23([:a, :b, nil, :c], ARGS@1:7-1:20(0, nil, nil, nil, 0, nil, nil, KW_ARG@1:7-1:15(DASGN@1:7-1:9(:a, :NODE_SPECIAL_REQUIRED_KEYWORD), KW_ARG@1:11-1:15(DASGN@1:11-1:15(:b, INTEGER@1:14-1:15(2)), nil)), DVAR@1:17-1:20(:c), nil), BEGIN@1:21-1:21(nil))))
SCOPE@1:0-1:12([], nil, ITER@1:0-1:12(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:12([:b], ARGS@1:7-1:9(0, nil, nil, nil, 0, nil, nil, nil, nil, :b), BEGIN@1:10-1:10(nil))))
SCOPE@1:0-1:29([], nil, LAMBDA@1:0-1:29(SCOPE@1:3-1:29([:a, :b, :c, :d, nil, :e], ARGS@1:4-1:24(1, nil, OPT_ARG@1:7-1:12(DASGN@1:7-1:12(:b, INTEGER@1:11-1:12(1)), nil), nil, 0, nil, :c, KW_ARG@1:18-1:20(DASGN@1:18-1:20(:d, :NODE_SPECIAL_REQUIRED_KEYWORD), nil), DVAR@1:18-1:20(nil), :e), BEGIN@1:27-1:27(nil))))
SCOPE@1:0-1:14([], nil, LAMBDA@1:0-1:14(SCOPE@1:2-1:14([:x], ARGS@1:3-1:4(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:9-1:10(:x))))
SCOPE@1:0-1:23([:x], nil, LASGN@1:0-1:23(:x, ITER@1:4-1:23(FCALL@1:4-1:10(:lambda, nil), SCOPE@1:11-1:23([:y], ARGS@1:15-1:16(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:18-1:19(:y)))))
SCOPE@1:0-9:3([], nil, DEFN@1:0-9:3(:foo, SCOPE@1:0-9:3([:e], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ENSURE@2:2-8:3(RESCUE@2:2-6:3(YIELD@2:2-2:9(LIST@2:8-2:9(INTEGER@2:8-2:9(1), nil)), RESBODY@3:0-4:3(LIST@3:7-3:8(CONST@3:7-3:8(:A), nil), LASGN@3:9-3:13(:e, ERRINFO@3:9-3:13()), LVAR@4:2-4:3(:e), nil), INTEGER@6:2-6:3(2)), INTEGER@8:2-8:3(3)))))
SCOPE@1:0-1:25([], nil, DEFN@1:0-1:25(:foo, SCOPE@1:0-1:25([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), SUPER@1:9-1:20(BLOCK_PASS@1:15-1:19(nil, VCALL@1:16-1:19(:blk))))))
SCOPE@1:0-1:22([], nil, DEFN@1:0-1:22(:foo, SCOPE@1:0-1:22([:*], ARGS@1:8-1:9(0, nil, nil, nil, 0, nil, :*, nil, nil, nil), BLOCK@1:10-1:17(BEGIN@1:10-1:10(nil), ZSUPER@1:12-1:17()))))
SCOPE@1:0-3:3([], nil, DEFN@1:0-3:3(:method_missing, SCOPE@1:0-3:3([:name, :args, :block], ARGS@1:19-1:38(1, nil, nil, nil, 0, nil, :args, nil, nil, :block), ZSUPER@2:2-2:7())))
SCOPE@1:0-1:19([], nil, FCALL@1:0-1:19(:alias_method, LIST@1:13-1:19(SYM@1:13-1:15(:a), SYM@1:17-1:19(:b), nil)))
SCOPE@1:0-1:9([], nil, ALIAS@1:0-1:9(SYM@1:6-1:7(:+), SYM@1:8-1:9(:-)))
SCOPE@1:0-1:11([], nil, UNDEF@1:0-1:11([SYM@1:6-1:8(:a), SYM@1:10-1:11(:b)]))
SCOPE@1:0-1:18([], nil, AND@1:0-1:18(DEFINED@1:0-1:12(IVAR@1:9-1:11(:@a)), IVAR@1:16-1:18(:@a)))
SCOPE@1:0-1:16([], nil, DEFINED@1:0-1:16(CALL@1:9-1:16(VCALL@1:9-1:12(:foo), :bar, nil)))
SCOPE@1:0-1:16([], nil, DEFINED@1:0-1:16(CONST@1:9-1:15(:String)))
SCOPE@1:0-1:9([], nil, FCALL@1:0-1:9(:foo, BLOCK_PASS@1:4-1:8(nil, VCALL@1:5-1:8(:blk))))
SCOPE@1:0-1:28([], nil, DEFN@1:0-1:28(:foo, SCOPE@1:0-1:28([:a, :b], ARGS@1:8-1:22(0, nil, OPT_ARG@1:8-1:22(LASGN@1:8-1:14(:a, HASH@1:12-1:14(nil)), OPT_ARG@1:16-1:22(LASGN@1:16-1:22(:b, ZLIST@1:20-1:22()), nil)), nil, 0, nil, nil, nil, nil, nil), nil)))
SCOPE@1:0-1:33([], nil, CALL@1:0-1:33(ITER@1:0-1:22(FCALL@1:0-1:4(:proc, nil), SCOPE@1:5-1:22([:a, :b], ARGS@1:8-1:12(2, nil, nil, nil, 0, nil, nil, nil, nil, nil), LIST@1:14-1:20(DVAR@1:15-1:16(:a), DVAR@1:18-1:19(:b), nil))), :call, LIST@1:28-1:32(INTEGER@1:28-1:29(1), INTEGER@1:31-1:32(2), nil)))
SCOPE@1:0-2:3([], nil, ITER@1:0-2:3(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-2:3([], nil, BEGIN@1:6-1:6(nil))))
SCOPE@1:0-2:3([], nil, ITER@1:0-2:3(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-2:3([:x], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:10-1:10(nil))))
SCOPE@1:0-2:4([], nil, ITER@1:0-2:4(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-2:4([:x], ARGS@1:7-1:8(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@2:1-2:2(:x))))
SCOPE@1:0-1:67([], nil, DEFN@1:0-1:67(:foo, SCOPE@1:0-1:67([:a, :b, :c, :d, :e, nil, :f, :g], ARGS@1:8-1:38(1, nil, OPT_ARG@1:11-1:16(LASGN@1:11-1:16(:b, LVAR@1:15-1:16(:a)), nil), :d, 1, nil, :c, KW_ARG@1:25-1:29(LASGN@1:25-1:29(:e, LVAR@1:28-1:29(:d)), nil), DVAR@1:31-1:34(:f), :g), BLOCK@1:39-1:62(BEGIN@1:39-1:39(nil), LIST@1:41-1:62(LVAR@1:42-1:43(:a), LVAR@1:45-1:46(:b), LVAR@1:48-1:49(:c), LVAR@1:51-1:52(:d), LVAR@1:54-1:55(:e), LVAR@1:57-1:58(:f), LVAR@1:60-1:61(:g), nil)))))
SCOPE@1:0-5:3([], nil, CLASS@1:0-5:3(COLON2@1:6-1:7(nil, :A), nil, SCOPE@1:0-5:3([], nil, BLOCK@1:7-4:5(BEGIN@1:7-1:7(nil), CLASS@2:2-4:5(COLON2@2:8-2:9(nil, :B), nil, SCOPE@2:2-4:5([], nil, BLOCK@2:9-3:14(BEGIN@2:9-2:9(nil), DEFN@3:4-3:14(:c, SCOPE@3:4-3:14([], ARGS@3:9-3:9(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), nil)))))))))
SCOPE@1:0-3:3([], nil, MODULE@1:0-3:3(COLON2@1:7-1:8(nil, :M), SCOPE@1:0-3:3([], nil, BLOCK@1:8-2:16(BEGIN@1:8-1:8(nil), DEFS@2:2-2:16(SELF@2:6-2:10(), :a, SCOPE@2:2-2:16([], ARGS@2:2-2:12(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@2:15-2:16(1)))))))
SCOPE@1:0-1:18([], nil, DEFN@1:0-1:18(:foo, SCOPE@1:0-1:18([:x], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), FCALL@1:13-1:18(:bar, LIST@1:17-1:18(LVAR@1:17-1:18(:x), nil)))))
SCOPE@1:0-1:10([], nil, ITER@1:0-1:10(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:10([:_1], ARGS@1:10-1:10(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:6-1:8(:_1))))
SCOPE@1:0-1:10([], nil, ITER@1:0-1:10(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:10([:_1, :_2], ARGS@1:10-1:10(2, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:6-1:8(:_2))))
SCOPE@1:0-1:15([], nil, ITER@1:0-1:15(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:15([:"<it>"], ARGS@1:15-1:15(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), OPCALL@1:6-1:13(DVAR@1:6-1:8(:"<it>"), :+, LIST@1:11-1:13(DVAR@1:11-1:13(:"<it>"), nil)))))
SCOPE@1:0-1:15([], nil, ITER@1:0-1:15(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:15([:it], ARGS@1:7-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:11-1:13(:it))))
SCOPE@1:0-1:18([], nil, ITER@1:0-1:18(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:18([], nil, ITER@1:6-1:16(FCALL@1:6-1:9(:bar, nil), SCOPE@1:10-1:16([:"<it>"], ARGS@1:16-1:16(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:12-1:14(:"<it>"))))))
SCOPE@1:0-1:16([], nil, DEFN@1:0-1:16(:foo, SCOPE@1:0-1:16([], ARGS@1:0-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:10-1:16(BLOCK@1:11-1:15(INTEGER@1:11-1:12(1), INTEGER@1:14-1:15(2))))))
SCOPE@1:0-1:11([], nil, DEFS@1:0-1:11(VCALL@1:4-1:5(:a), :b, SCOPE@1:0-1:11([], ARGS@1:0-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:10-1:11(1))))
SCOPE@1:0-1:19([], nil, ITER@1:0-1:19(FCALL@1:0-1:12(:foo, LIST@1:4-1:12(VCALL@1:4-1:7(:bar), VCALL@1:9-1:12(:baz), nil)), SCOPE@1:13-1:19([], nil, BEGIN@1:15-1:15(nil))))
SCOPE@1:0-1:18([], nil, ITER@1:0-1:18(CALL@1:0-1:11(VCALL@1:0-1:3(:foo), :bar, LIST@1:8-1:11(VCALL@1:8-1:11(:baz), nil)), SCOPE@1:12-1:18([], nil, BEGIN@1:14-1:14(nil))))
SCOPE@1:0-1:25([:a], nil, LASGN@1:0-1:25(:a, ITER@1:4-1:25(FCALL@1:4-1:8(:proc, nil), SCOPE@1:9-1:25([:x, :y], ARGS@1:12-1:13(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), DASGN@1:18-1:23(:y, DVAR@1:22-1:23(:x))))))
SCOPE@1:0-1:13([:x], nil, BLOCK@1:0-1:13(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), HASH@1:7-1:13(LIST@1:9-1:11(SYM@1:9-1:11(:x), LVAR@1:9-1:11(:x), nil))))
SCOPE@1:0-1:6([], nil, HASH@1:0-1:6(LIST@1:2-1:4(SYM@1:2-1:4(:x), VCALL@1:2-1:4(:x), nil)))
SCOPE@1:0-1:7([], nil, FCALL@1:0-1:7(:foo, LIST@1:4-1:6(HASH@1:4-1:6(LIST@1:4-1:6(SYM@1:4-1:6(:x), VCALL@1:4-1:6(:x), nil)), nil)))
SCOPE@1:0-1:30([], nil, DEFN@1:0-1:30(:foo, SCOPE@1:0-1:30([:x], ARGS@1:8-1:9(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:10-1:25(BEGIN@1:10-1:10(nil), FCALL@1:12-1:25(:bar, LIST@1:16-1:24(HASH@1:16-1:24(LIST@1:16-1:24(SYM@1:16-1:18(:x), LVAR@1:16-1:18(:x), SYM@1:20-1:22(:y), INTEGER@1:23-1:24(1), nil)), nil))))))
SCOPE@1:0-1:10([], nil, SPLAT@1:0-1:10(SUPER@1:2-1:9(nil)))
SCOPE@1:0-1:6([], nil, SPLAT@1:0-1:6(VCALL@1:2-1:5(:foo)))
SCOPE@1:0-1:23([], nil, ITER@1:0-1:23(CALL@1:0-1:23(ITER@1:0-1:12(FCALL@1:0-1:5(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :bar, nil), SCOPE@1:17-1:23([], nil, BEGIN@1:19-1:19(nil))))
SCOPE@1:0-1:16([], nil, CALL@1:0-1:16(ITER@1:0-1:12(FCALL@1:0-1:5(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :bar, nil))
SCOPE@1:0-1:18([], nil, CALL@1:0-1:18(ITER@1:0-1:12(FCALL@1:0-1:5(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :bar, LIST@1:17-1:18(INTEGER@1:17-1:18(2), nil)))
SCOPE@1:0-1:20([], nil, ITER@1:0-1:20(CALL@1:0-1:20(ITER@1:0-1:12(FCALL@1:0-1:5(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :bar, nil), SCOPE@1:17-1:20([], nil, BEGIN@1:18-1:18(nil))))
SCOPE@1:0-1:26([], nil, ITER@1:0-1:26(CALL@1:0-1:26(ITER@1:0-1:12(FCALL@1:0-1:5(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :bar, LIST@1:17-1:18(INTEGER@1:17-1:18(2), nil)), SCOPE@1:20-1:26([], nil, BEGIN@1:22-1:22(nil))))
SCOPE@1:0-1:40([], nil, DEFN@1:0-1:40(:m, SCOPE@1:0-1:40([], ARGS@1:5-1:5(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), SCLASS@1:7-1:35(SELF@1:16-1:20(), SCOPE@1:7-1:35([], nil, RETURN@1:22-1:30(INTEGER@1:29-1:30(1)))))))
SyntaxError: class definition in method body
SCOPE@1:0-1:48([], nil, DEFN@1:0-1:48(:m, SCOPE@1:0-1:48([], ARGS@1:5-1:5(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ITER@1:7-1:43(FCALL@1:7-1:10(:foo, nil), SCOPE@1:11-1:43([], nil, SCLASS@1:13-1:41(SELF@1:22-1:26(), SCOPE@1:13-1:41([], nil, RETURN@1:28-1:36(INTEGER@1:35-1:36(1)))))))))
SCOPE@1:0-3:3([], nil, ITER@1:0-3:3(CALL@1:0-3:3(ITER@1:0-2:3(CALL@1:0-1:20(CONST@1:0-1:10(:TracePoint), :new, LIST@1:15-1:20(SYM@1:15-1:20(:call), nil)), SCOPE@1:21-2:3([:tp], ARGS@1:25-1:27(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), BEGIN@1:28-1:28(nil))), :enable, nil), SCOPE@2:11-3:3([], nil, BEGIN@2:13-2:13(nil))))
SCOPE@1:0-1:23([], nil, CALL@1:0-1:23(ITER@1:0-1:21(CALL@1:0-1:21(ITER@1:0-1:12(CALL@1:0-1:5(VCALL@1:0-1:1(:a), :b, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :c, nil), SCOPE@1:15-1:21([], nil, BEGIN@1:17-1:17(nil))), :d, nil))
SCOPE@1:0-1:19([], nil, CALL@1:0-1:19(ITER@1:0-1:12(FCALL@1:0-1:5(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :bar, LIST@1:17-1:18(INTEGER@1:17-1:18(2), nil)))
SCOPE@1:0-1:20([], nil, CALL@1:0-1:20(CALL@1:0-1:16(ITER@1:0-1:12(FCALL@1:0-1:5(:foo, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))), :bar, nil), :baz, nil))
SCOPE@1:0-1:8([], nil, FCALL@1:0-1:8(:p, LIST@1:2-1:7(CALL@1:2-1:7(VCALL@1:2-1:3(:a), :b, LIST@1:6-1:7(INTEGER@1:6-1:7(1), nil)), nil)))
SCOPE@1:0-1:10([], nil, FCALL@1:0-1:10(:p, LIST@1:2-1:9(FCALL@1:2-1:9(:bar, LIST@1:6-1:9(LIST@1:6-1:9(INTEGER@1:7-1:8(2), nil), nil)), nil)))
SCOPE@1:0-1:12([], nil, FCALL@1:0-1:12(:p, LIST@1:2-1:11(FCALL@1:2-1:11(:gather, LIST@1:9-1:11(BEGIN@1:10-1:10(nil), nil)), nil)))
SCOPE@1:0-1:11([], nil, FCALL@1:0-1:11(:p, LIST@1:2-1:10(CALL@1:2-1:10(VCALL@1:2-1:3(:a), :b, LIST@1:6-1:10(INTEGER@1:6-1:7(1), INTEGER@1:9-1:10(2), nil)), nil)))
SCOPE@1:0-1:22([], nil, ITER@1:0-1:22(QCALL@1:0-1:15(ITER@1:0-1:10(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:10([], nil, BEGIN@1:6-1:6(nil))), :bar, nil), SCOPE@1:16-1:22([], nil, BEGIN@1:18-1:18(nil))))
SCOPE@1:0-1:17([], nil, FCALL@1:0-1:17(:p, LIST@1:2-1:16(BLOCK@1:2-1:16(ITER@1:3-1:15(FCALL@1:3-1:8(:foo, LIST@1:7-1:8(INTEGER@1:7-1:8(1), nil)), SCOPE@1:9-1:15([], nil, BEGIN@1:11-1:11(nil)))), nil)))
SCOPE@1:0-1:12([], nil, ITER@1:0-1:12(CALL@1:0-1:5(VCALL@1:0-1:1(:a), :b, LIST@1:4-1:5(INTEGER@1:4-1:5(1), nil)), SCOPE@1:6-1:12([], nil, BEGIN@1:8-1:8(nil))))
SCOPE@1:0-1:13([], nil, ITER@1:0-1:13(QCALL@1:0-1:6(VCALL@1:0-1:1(:a), :b, LIST@1:5-1:6(INTEGER@1:5-1:6(1), nil)), SCOPE@1:7-1:13([], nil, BEGIN@1:9-1:9(nil))))
SCOPE@1:0-1:7([], nil, FCALL@1:0-1:7(:foo, LIST@1:4-1:7(INTEGER@1:5-1:6(1), nil)))
SCOPE@1:0-1:10([], nil, FCALL@1:0-1:10(:foo, LIST@1:4-1:10(BLOCK@1:5-1:9(INTEGER@1:5-1:6(1), INTEGER@1:8-1:9(2)), nil)))
SCOPE@1:0-1:6([], nil, FCALL@1:0-1:6(:foo, LIST@1:4-1:6(BEGIN@1:5-1:5(nil), nil)))
SCOPE@1:0-1:10([], nil, FCALL@1:0-1:10(:foo, LIST@1:4-1:10(INTEGER@1:5-1:6(1), INTEGER@1:9-1:10(2), nil)))
SCOPE@1:0-1:9([], nil, FCALL@1:0-1:9(:foo, LIST@1:4-1:9(BLOCK@1:5-1:8(INTEGER@1:6-1:7(1)), nil)))
SCOPE@1:0-1:21([], nil, ITER@1:0-1:21(CALL@1:0-1:17(ITER@1:0-1:10(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:10([], nil, BEGIN@1:6-1:6(nil))), :bar, LIST@1:15-1:16(INTEGER@1:15-1:16(2), nil)), SCOPE@1:18-1:21([], nil, BEGIN@1:19-1:19(nil))))
SCOPE@1:0-1:23([], nil, ITER@1:0-1:23(CALL@1:0-1:16(ITER@1:0-1:10(FCALL@1:0-1:3(:foo, nil), SCOPE@1:4-1:10([], nil, BEGIN@1:6-1:6(nil))), :bar, LIST@1:15-1:16(INTEGER@1:15-1:16(1), nil)), SCOPE@1:17-1:23([], nil, BEGIN@1:19-1:19(nil))))
SCOPE@1:0-1:15([], nil, LAMBDA@1:0-1:15(SCOPE@1:2-1:15([], ARGS@1:2-1:2(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), LAMBDA@1:5-1:13(SCOPE@1:7-1:13([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:10-1:11(2))))))
SCOPE@1:0-1:18([], nil, LAMBDA@1:0-1:18(SCOPE@1:2-1:18([], ARGS@1:2-1:2(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), BLOCK@1:5-1:16(LAMBDA@1:5-1:13(SCOPE@1:7-1:13([], ARGS@1:7-1:7(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:10-1:11(2))), INTEGER@1:15-1:16(3)))))
SCOPE@1:0-1:21([], nil, LAMBDA@1:0-1:21(SCOPE@1:2-1:21([], ARGS@1:2-1:2(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), LAMBDA@1:6-1:17(SCOPE@1:8-1:17([], ARGS@1:8-1:8(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:12-1:13(2))))))
SCOPE@1:0-1:12([], nil, FCALL@1:0-1:12(:foo, LIST@1:4-1:12(LAMBDA@1:4-1:12(SCOPE@1:6-1:12([], ARGS@1:6-1:6(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), INTEGER@1:9-1:10(1))), nil)))
SCOPE@1:0-1:14([], nil, LAMBDA@1:0-1:14(SCOPE@1:2-1:14([], ARGS@1:2-1:2(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), ITER@1:5-1:12(FCALL@1:5-1:6(:x, nil), SCOPE@1:7-1:12([], nil, INTEGER@1:9-1:10(1))))))
SCOPE@1:0-1:19([], nil, LAMBDA@1:0-1:19(SCOPE@1:3-1:19([:a], ARGS@1:4-1:5(1, nil, nil, nil, 0, nil, nil, nil, nil, nil), LAMBDA@1:9-1:17(SCOPE@1:11-1:17([], ARGS@1:11-1:11(0, nil, nil, nil, 0, nil, nil, nil, nil, nil), DVAR@1:14-1:15(:a))))))
```
