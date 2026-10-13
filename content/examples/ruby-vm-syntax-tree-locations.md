---
title: "ruby_vm/syntax_tree_locations.rb"
slug: ruby-vm-syntax-tree-locations
description: "The metorex example program ruby_vm/syntax_tree_locations.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_locations.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_locations.rb){target=_blank rel=noopener}.

```metorex
# RubyVM::AbstractSyntaxTree::Node#locations answers where a node is written,
# then where each keyword and operator MRI records for its type is, with nil
# for one the source does not write.

def span(location)
  return "nil" if location.nil?

  "#{location.first_lineno}:#{location.first_column}-#{location.last_lineno}:#{location.last_column}"
end

def recorded(node, found = [])
  return found unless node.is_a?(RubyVM::AbstractSyntaxTree::Node)

  locations = node.locations
  found << "#{node.type} #{locations.map { |location| span(location) }.join(" ")}" if locations.size > 1
  node.children.each { |child| recorded(child, found) }
  found
end

SOURCES = [
  "alias foo bar",
  "alias $new $old",
  "a && b and c",
  "a || b or c",
  "foo(*rest, &block)",
  "loop { break 1; next 2; redo }",
  "def m; return 1; end",
  "case a\nwhen 1 then :one\nwhen 2\n  :two\nend",
  "case a\nin [x] then x\nin Integer => n if n > 0\n  n\nend",
  "case\nwhen a then 1\nend",
  "value in [1]",
  "value => {name:}",
  "class Foo < Bar\nend",
  "class Foo::Bar; end",
  "class << self; end",
  "module Outer::Inner\nend",
  "Outer::Inner",
  "::Top",
  "defined? x",
  "1..2",
  "1...2",
  "if a..b then end",
  '"a#{b}c"',
  "for item in list do item end",
  "for item in list\n  item\nend",
  "-> (x) { x }",
  "-> x do x end",
  "if a then b elsif c then d else e end",
  "if a # note\n  b\nend",
  "if a\nthen b\nend",
  "x if a",
  "a ? b : c",
  "unless a; b; end",
  "list[0] += 1",
  "point.x ||= 0",
  "END { puts 1 }",
  "/abc/",
  "//",
  "[*items]",
  "def m(*) = other(*)",
  "def m; super(1); super 2; yield(3); yield 4; end",
  "undef foo, bar",
  "while a do b end",
  "begin; b; end while a",
  "until a\n  b\nend",
  "x until a"
]

SOURCES.each do |source|
  puts source.inspect
  recorded(RubyVM::AbstractSyntaxTree.parse(source)).each { |line| puts "  #{line}" }
end

first = RubyVM::AbstractSyntaxTree.parse("if a then b end").children[2].locations.first
p first
p [first.first_lineno, first.first_column, first.last_lineno, first.last_column]
p RubyVM::AbstractSyntaxTree.parse("a").locations.size
```

Output:

```
"alias foo bar"
  ALIAS 1:0-1:13 1:0-1:5
"alias $new $old"
  VALIAS 1:0-1:15 1:0-1:5
"a && b and c"
  AND 1:0-1:12 1:2-1:4
"a || b or c"
  OR 1:0-1:11 1:2-1:4
"foo(*rest, &block)"
  BLOCK_PASS 1:4-1:17 1:11-1:12
  SPLAT 1:4-1:9 1:4-1:5
"loop { break 1; next 2; redo }"
  BREAK 1:7-1:14 1:7-1:12
  NEXT 1:16-1:22 1:16-1:20
  REDO 1:24-1:28 1:24-1:28
"def m; return 1; end"
  RETURN 1:7-1:15 1:7-1:13
"case a\nwhen 1 then :one\nwhen 2\n  :two\nend"
  CASE 1:0-5:3 1:0-1:4 5:0-5:3
  WHEN 2:0-4:6 2:0-2:4 2:7-2:11
  WHEN 3:0-4:6 3:0-3:4 3:6-3:6
"case a\nin [x] then x\nin Integer => n if n > 0\n  n\nend"
  CASE3 1:0-5:3 1:0-1:4 5:0-5:3
  IN 2:0-4:3 2:0-2:2 2:7-2:11 nil
  IN 3:0-4:3 3:0-3:2 3:24-3:24 nil
  IF 3:3-3:24 3:16-3:18 nil nil
"case\nwhen a then 1\nend"
  CASE2 1:0-3:3 1:0-1:4 3:0-3:3
  WHEN 2:0-2:13 2:0-2:4 2:7-2:11
"value in [1]"
  CASE3 1:0-1:12 nil nil
  IN 1:9-1:12 1:6-1:8 nil nil
"value => {name:}"
  CASE3 1:0-1:16 nil nil
  IN 1:9-1:16 nil nil 1:6-1:8
"class Foo < Bar\nend"
  CLASS 1:0-2:3 1:0-1:5 1:10-1:11 2:0-2:3
  COLON2 1:6-1:9 nil 1:6-1:9
"class Foo::Bar; end"
  CLASS 1:0-1:19 1:0-1:5 nil 1:16-1:19
  COLON2 1:6-1:14 1:9-1:11 1:11-1:14
"class << self; end"
  SCLASS 1:0-1:18 1:0-1:5 1:6-1:8 1:15-1:18
"module Outer::Inner\nend"
  MODULE 1:0-2:3 1:0-1:6 2:0-2:3
  COLON2 1:7-1:19 1:12-1:14 1:14-1:19
"Outer::Inner"
  COLON2 1:0-1:12 1:5-1:7 1:7-1:12
"::Top"
  COLON3 1:0-1:5 1:0-1:2 1:2-1:5
"defined? x"
  DEFINED 1:0-1:10 1:0-1:8
"1..2"
  DOT2 1:0-1:4 1:1-1:3
"1...2"
  DOT3 1:0-1:5 1:1-1:4
"if a..b then end"
  IF 1:0-1:16 1:0-1:2 1:8-1:12 1:13-1:16
  FLIP2 1:3-1:7 1:4-1:6
"\"a\#{b}c\""
  EVSTR 1:2-1:6 1:2-1:4 1:5-1:6
"for item in list do item end"
  FOR 1:0-1:28 1:0-1:3 1:9-1:11 1:17-1:19 1:25-1:28
"for item in list\n  item\nend"
  FOR 1:0-3:3 1:0-1:3 1:9-1:11 nil 3:0-3:3
"-> (x) { x }"
  LAMBDA 1:0-1:12 1:0-1:2 1:7-1:8 1:11-1:12
"-> x do x end"
  LAMBDA 1:0-1:13 1:0-1:2 1:5-1:7 1:10-1:13
"if a then b elsif c then d else e end"
  IF 1:0-1:37 1:0-1:2 1:5-1:9 1:34-1:37
  IF 1:12-1:33 1:12-1:17 1:20-1:24 1:34-1:37
"if a # note\n  b\nend"
  IF 1:0-3:3 1:0-1:2 1:12-1:12 3:0-3:3
"if a\nthen b\nend"
  IF 1:0-3:3 1:0-1:2 1:4-2:4 3:0-3:3
"x if a"
  IF 1:0-1:6 1:2-1:4 nil nil
"a ? b : c"
  IF 1:0-1:9 nil 1:6-1:7 nil
"unless a; b; end"
  UNLESS 1:0-1:16 1:0-1:6 1:8-1:9 1:13-1:16
"list[0] += 1"
  OP_ASGN1 1:0-1:12 nil 1:4-1:5 1:6-1:7 1:8-1:10
"point.x ||= 0"
  OP_ASGN2 1:0-1:13 1:5-1:6 1:6-1:7 1:8-1:11
"END { puts 1 }"
  POSTEXE 1:0-1:14 1:0-1:3 1:4-1:5 1:13-1:14
"/abc/"
  REGX 1:0-1:5 1:0-1:1 1:1-1:4 1:4-1:5
"//"
  REGX 1:0-1:2 1:0-1:1 1:1-1:1 1:1-1:2
"[*items]"
  SPLAT 1:0-1:8 1:1-1:2
"def m(*) = other(*)"
  SPLAT 1:17-1:18 1:17-1:18
"def m; super(1); super 2; yield(3); yield 4; end"
  SUPER 1:7-1:15 1:7-1:12 1:12-1:13 1:14-1:15
  SUPER 1:17-1:24 1:17-1:22 nil nil
  YIELD 1:26-1:34 1:26-1:31 1:31-1:32 1:33-1:34
  YIELD 1:36-1:43 1:36-1:41 nil nil
"undef foo, bar"
  UNDEF 1:0-1:14 1:0-1:5
"while a do b end"
  WHILE 1:0-1:16 1:0-1:5 1:13-1:16
"begin; b; end while a"
  WHILE 1:0-1:21 1:14-1:19 nil
"until a\n  b\nend"
  UNTIL 1:0-3:3 1:0-1:5 3:0-3:3
"x until a"
  UNTIL 1:0-1:9 1:2-1:7 nil
#<RubyVM::AbstractSyntaxTree::Location:@1:0-1:15>
[1, 0, 1, 15]
1
```
