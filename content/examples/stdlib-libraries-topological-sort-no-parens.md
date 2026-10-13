---
title: "stdlib_libraries/topological_sort_no_parens.rb"
slug: stdlib-libraries-topological-sort-no-parens
description: "The metorex example program stdlib_libraries/topological_sort_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/topological_sort_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/topological_sort_no_parens.rb){target=_blank rel=noopener}.

```metorex
# TSort orders a graph so each node comes after the nodes it reaches, and
# finds its strongly connected components.
require "tsort"

class Dependencies < Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

steps = Dependencies[{ "deploy" => ["build", "test"], "build" => ["fetch"], "test" => ["build"], "fetch" => [] }]
p steps.tsort
p steps.strongly_connected_components
steps.each_strongly_connected_component { |component| p component }
p steps.tsort_each.to_a
p steps.each_strongly_connected_component_from("test").to_a
cyclic = Dependencies[{ 1 => [2, 3], 2 => [3], 3 => [2], 4 => [] }]
p cyclic.strongly_connected_components
begin
  cyclic.tsort
rescue TSort::Cyclic => error
  p error.message
end
p TSort::Cyclic.superclass
graph = { 1 => [2, 3], 2 => [4], 3 => [2, 4], 4 => [] }
each_node = ->(&block) { graph.each_key(&block) }
each_child = ->(node, &block) { graph[node].each(&block) }
p TSort.tsort(each_node, each_child)
p TSort.strongly_connected_components(each_node, each_child)
p TSort.tsort_each(each_node, each_child).class
TSort.each_strongly_connected_component_from(1, each_child) { |component| p component }
p TSort::VERSION
class Unfinished
  include TSort
end
begin
  Unfinished.new.tsort
rescue NotImplementedError => error
  p error.class
end
```

Output:

```
["fetch", "build", "test", "deploy"]
[["fetch"], ["build"], ["test"], ["deploy"]]
["fetch"]
["build"]
["test"]
["deploy"]
["fetch", "build", "test", "deploy"]
[["fetch"], ["build"], ["test"]]
[[2, 3], [1], [4]]
"topological sort failed: [2, 3]"
StandardError
[4, 2, 3, 1]
[[4], [2], [3], [1]]
Enumerator
[4]
[2]
[3]
[1]
"0.2.0"
NotImplementedError
```
