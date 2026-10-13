---
title: "oop/definition_values.rb"
slug: oop-definition-values
description: "The metorex example program oop/definition_values.rb and its output."
---

`tests/_examples/oop/definition_values.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/definition_values.rb).

```metorex
puts(eval("class Twenty; 20; end").to_s)
puts(eval("module Held; :held; end").to_s)
puts(eval("class Empty; end").inspect)

class Named
  @tally = 0
  @@shared = :shared
end
puts(Named.instance_variables.inspect)
puts(Named.class_variables.inspect)

begin
  eval("class FromString < ''; end")
rescue TypeError => error
  puts(error.message)
end

# A call written onto the `end` reads what the body answered, not the class.
module Wrapper
  class Inner
    :inner
  end.to_s.tap { |answered| puts(answered) }
end
```

Output:

```
20
held
nil
[:@tally]
[:@@shared]
superclass must be an instance of Class (given an instance of String)
inner
```
