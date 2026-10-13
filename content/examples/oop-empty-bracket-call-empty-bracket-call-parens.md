---
title: "oop/empty_bracket_call/empty_bracket_call_parens.rb"
slug: oop-empty-bracket-call-empty-bracket-call-parens
description: "The metorex example program oop/empty_bracket_call/empty_bracket_call_parens.rb and its output."
---

`tests/_examples/oop/empty_bracket_call/empty_bracket_call_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/empty_bracket_call/empty_bracket_call_parens.rb){target=_blank rel=noopener}.

```metorex
class Stack
  def initialize
    @items = [1, 2, 3]
  end

  def []
    @items.length
  end
end

s = Stack.new
puts s[]
```

Output:

```
3
```
