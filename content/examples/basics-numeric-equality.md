---
title: "basics/numeric_equality.rb"
slug: basics-numeric-equality
description: "The metorex example program basics/numeric_equality.rb and its output."
---

`tests/_examples/basics/numeric_equality.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/numeric_equality.rb).

```metorex
puts 1 == 1.0
puts 1.0 == 1
puts 1 == 1.5
puts 2 != 2.0
puts([1, 2] == [1.0, 2.0])
puts({a: 1} == {a: 1.0})

class Probe
  def to_s
    "probe"
  end
end

probe = Probe.new
defined_to_s = defined?(probe.to_s)
p defined_to_s
defined_missing = defined?(probe.missing_method)
p defined_missing
defined_new = defined?(String.new)
p defined_new
defined_absent = defined?(String.no_such_method)
p defined_absent
```

Output:

```
true
true
false
false
true
true
"method"
nil
"method"
nil
```
