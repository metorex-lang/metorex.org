---
title: "basics/each_block.rb"
slug: basics-each-block
description: "The metorex example program basics/each_block.rb and its output."
---

`tests/_examples/basics/each_block.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/each_block.rb){target=_blank rel=noopener}.

```metorex
# Test block iteration with each

# Test with range
puts("Range iteration:")
(1..3).each do |n|
  puts(n)
end

# Test with array
puts("Array iteration:")
arr = [10, 20, 30]
arr.each do |val|
  puts(val)
end
```

Output:

```
Range iteration:
1
2
3
Array iteration:
10
20
30
```
