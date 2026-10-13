---
title: "parser/paren_ivar_assign.rb"
slug: parser-paren-ivar-assign
description: "The metorex example program parser/paren_ivar_assign.rb and its output."
---

`tests/_examples/parser/paren_ivar_assign.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/parser/paren_ivar_assign.rb).

```metorex
class Foo
  def bar
    (@x = 5).to_s
  end
end

puts Foo.new.bar
```
