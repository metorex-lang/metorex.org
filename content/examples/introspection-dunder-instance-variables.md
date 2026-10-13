---
title: "introspection/dunder_instance_variables.rb"
slug: introspection-dunder-instance-variables
description: "The metorex example program introspection/dunder_instance_variables.rb and its output."
---

`tests/_examples/introspection/dunder_instance_variables.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/dunder_instance_variables.rb).

```metorex
class Ledger
  def initialize
    @__hidden = 1
    @shown = 2
  end
end
p Ledger.new.instance_variables
class Ledger
  def initialize
    @__hidden = 1
  end
end
l = Ledger.new
p l.inspect.sub(/0x\h+/, ""), l.dup.instance_variables, l.instance_variable_get(:@__hidden)
l.instance_variable_set(:@__set, 2)
p l.instance_variables
```

Output:

```
[:@__hidden, :@shown]
"#<Ledger: @__hidden=1>"
[:@__hidden]
1
[:@__hidden, :@__set]
```
