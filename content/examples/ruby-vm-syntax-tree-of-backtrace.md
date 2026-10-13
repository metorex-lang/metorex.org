---
title: "ruby_vm/syntax_tree_of_backtrace.rb"
slug: ruby-vm-syntax-tree-of-backtrace
description: "The metorex example program ruby_vm/syntax_tree_of_backtrace.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_of_backtrace.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_of_backtrace.rb).

```metorex
# Each location in a backtrace finds the call node written at it, the call
# a native method such as Array#each stands at among them.
def calls_missing = nil.no_such_method

[1].each do
  [2].each { calls_missing }
rescue NoMethodError => raised
  raised.backtrace_locations.each do |location|
    node = RubyVM::AbstractSyntaxTree.of(location)
    p([location.label, node.type, node.first_lineno, node.first_column])
  end
end

begin
  [3].map { |number| number / 0 }
rescue ZeroDivisionError => raised
  node = RubyVM::AbstractSyntaxTree.of(raised.backtrace_locations.first)
  p([node.type, node.first_column, node.last_column])
end
```

Output:

```
["Object#calls_missing", :CALL, 3, 20]
["block (2 levels) in <main>", :VCALL, 6, 13]
["Array#each", :CALL, 6, 2]
["block in <main>", :CALL, 6, 2]
["Array#each", :CALL, 5, 0]
["<main>", :CALL, 5, 0]
[:OPCALL, 21, 31]
```
