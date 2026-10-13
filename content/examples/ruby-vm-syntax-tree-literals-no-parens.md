---
title: "ruby_vm/syntax_tree_literals_no_parens.rb"
slug: ruby-vm-syntax-tree-literals-no-parens
description: "The metorex example program ruby_vm/syntax_tree_literals_no_parens.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_literals_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_literals_no_parens.rb).

```metorex
# RubyVM::AbstractSyntaxTree parses a program into the nodes MRI's parser
# makes: a SCOPE holding the program's statements, a BLOCK when there is more
# than one, and a node per literal, each spanning the text it was written as.

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

[
  "1", "1.5", "2r", "3i", "-5", "0x1f", "\"text\"", "'single'", "\"a\" \"b\"",
  ":sym", ":\"quoted sym\"", "nil", "true", "false", "self", "__LINE__",
  "1\n2", "1; 2; 3", "", "# comment\n1", "(1)", "1;", "\"line one\nline two\""
].each { |source| puts dump(RubyVM::AbstractSyntaxTree.parse(source)) }

tree = RubyVM::AbstractSyntaxTree.parse "1 ;"
p tree
p [tree.type, tree.children.size]

begin
  RubyVM::AbstractSyntaxTree.parse "1 +"
rescue SyntaxError => trouble
  p trouble.class
end

require "tempfile"
Tempfile.create(["written", ".rb"]) do |file|
  file.write "true\n"
  file.flush
  puts dump(RubyVM::AbstractSyntaxTree.parse_file(file.path))
end
```

Output:

```
SCOPE@1:0-1:1([], nil, INTEGER@1:0-1:1(1))
SCOPE@1:0-1:3([], nil, FLOAT@1:0-1:3(1.5))
SCOPE@1:0-1:2([], nil, RATIONAL@1:0-1:2((2/1)))
SCOPE@1:0-1:2([], nil, IMAGINARY@1:0-1:2((0+3i)))
SCOPE@1:0-1:2([], nil, INTEGER@1:0-1:2(-5))
SCOPE@1:0-1:4([], nil, INTEGER@1:0-1:4(31))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("text"))
SCOPE@1:0-1:8([], nil, STR@1:0-1:8("single"))
SCOPE@1:0-1:7([], nil, STR@1:0-1:3("ab"))
SCOPE@1:0-1:4([], nil, SYM@1:0-1:4(:sym))
SCOPE@1:0-1:13([], nil, SYM@1:0-1:13(:"quoted sym"))
SCOPE@1:0-1:3([], nil, NIL@1:0-1:3())
SCOPE@1:0-1:4([], nil, TRUE@1:0-1:4())
SCOPE@1:0-1:5([], nil, FALSE@1:0-1:5())
SCOPE@1:0-1:4([], nil, SELF@1:0-1:4())
SCOPE@1:0-1:8([], nil, LINE@1:0-1:8(1))
SCOPE@1:0-2:1([], nil, BLOCK@1:0-2:1(INTEGER@1:0-1:1(1), INTEGER@2:0-2:1(2)))
SCOPE@1:0-1:7([], nil, BLOCK@1:0-1:7(INTEGER@1:0-1:1(1), INTEGER@1:3-1:4(2), INTEGER@1:6-1:7(3)))
SCOPE@1:0-1:0([], nil, BEGIN@1:0-1:0(nil))
SCOPE@1:0-2:1([], nil, INTEGER@2:0-2:1(1))
SCOPE@1:0-1:3([], nil, BLOCK@1:0-1:3(INTEGER@1:1-1:2(1)))
SCOPE@1:0-1:2([], nil, INTEGER@1:0-1:1(1))
SCOPE@1:0-2:9([], nil, STR@1:0-2:9("line one\nline two"))
#<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-1:3>
[:SCOPE, 3]
SyntaxError
SCOPE@1:0-1:4([], nil, TRUE@1:0-1:4())
```
