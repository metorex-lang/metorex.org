---
title: "advanced/multi_bracket_args.rb"
slug: advanced-multi-bracket-args
description: "The metorex example program advanced/multi_bracket_args.rb and its output."
---

`tests/_examples/advanced/multi_bracket_args.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/multi_bracket_args.rb).

```metorex
# Test obj[a, b, c] syntax (multi-arg bracket indexing)
class Grid
  def [](row, col, depth)
    "#{row},#{col},#{depth}"
  end
end
g = Grid.new
puts g[1, 2, 3]
```

Output:

```
1,2,3
```
