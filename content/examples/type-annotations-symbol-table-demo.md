---
title: "type_annotations/symbol_table_demo.rb"
slug: type-annotations-symbol-table-demo
description: "The metorex example program type_annotations/symbol_table_demo.rb and its output."
---

`tests/_examples/type_annotations/symbol_table_demo.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/type_annotations/symbol_table_demo.rb).

```metorex
counter = 0  # int
name = "Symbol Table Demo"  # str
pi = 3.14159  # float
active = true  # bool

def process_data(x, y)  # int, int -> int
  local_sum = x + y  # int
  local_product = x * y  # int
  local_temp = local_sum + local_product
  local_temp
end

counter = counter + 1
counter = counter + 1

result = process_data(10, 20)
puts "Global counter: #{counter}"
puts "Global name: #{name}"
puts "Global pi: #{pi}"
puts "Global active: #{active}"
puts "Result from process_data: #{result}"

counter = 999
puts "Counter after reassignment: #{counter}"
```
