---
title: "methods/alias_of_a_setter_no_parens.rb"
slug: methods-alias-of-a-setter-no-parens
description: "The metorex example program methods/alias_of_a_setter_no_parens.rb and its output."
---

`tests/_examples/methods/alias_of_a_setter_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/alias_of_a_setter_no_parens.rb){target=_blank rel=noopener}.

```metorex
# `alias` takes a setter's name with its `=`, written bare or as a symbol.
class Schedule
  attr_reader :window

  def set_window value
    @window = value
  end

  alias window= set_window
  alias :slot= :set_window
end

schedule = Schedule.new
schedule.window = "02:00"
p schedule.window
schedule.slot = "03:00"
p schedule.window
p Schedule.instance_method(:window=).original_name
```

Output:

```
"02:00"
"03:00"
:set_window
```
