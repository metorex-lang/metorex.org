---
title: "oop/multi_arg_bracket/multi_arg_bracket.rb"
slug: oop-multi-arg-bracket-multi-arg-bracket
description: "The metorex example program oop/multi_arg_bracket/multi_arg_bracket.rb and its output."
---

`tests/_examples/oop/multi_arg_bracket/multi_arg_bracket.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/multi_arg_bracket/multi_arg_bracket.rb){target=_blank rel=noopener}.

```metorex
class Matrix
  def initialize
    @data = [[1, 2], [3, 4]]
  end

  def [](row, col)
    @data[row][col]
  end
end

m = Matrix.new
puts(m[0, 0])
puts(m[0, 1])
puts(m[1, 0])
puts(m[1, 1])
```

Output:

```
1
2
3
4
```
