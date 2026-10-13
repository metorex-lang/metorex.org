---
title: "methods/include_inside_an_instance_method.rb"
slug: methods-include-inside-an-instance-method
description: "The metorex example program methods/include_inside_an_instance_method.rb and its output."
---

`tests/_examples/methods/include_inside_an_instance_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/include_inside_an_instance_method.rb).

```metorex
class Settings
  def initialize
    @included = []
  end

  def include(mod, *filters)
    @included << [mod, filters]
  end

  def expose
    include Comparable
    include Enumerable, :tagged
    @included
  end
end

p Settings.new.expose
p Settings.include?(Comparable)
```

Output:

```
[[Comparable, []], [Enumerable, [:tagged]]]
false
```
