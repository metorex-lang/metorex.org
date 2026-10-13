---
title: "oop/alias_keyword.rb"
slug: oop-alias-keyword
description: "The metorex example program oop/alias_keyword.rb and its output."
---

`tests/_examples/oop/alias_keyword.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/alias_keyword.rb).

```metorex
# `alias` keyword — creates a method alias inside a class/module body.
# Supports both bareword (`alias new_name old_name`) and symbol
# (`alias :new :old`) forms.

class Greeter
  def hello
    :hi
  end

  # Bareword form.
  alias greet hello

  def bye
    :bye
  end

  # Symbol form.
  alias :farewell :bye
end

g = Greeter.new
puts g.hello
puts g.greet
puts g.bye
puts g.farewell
```
