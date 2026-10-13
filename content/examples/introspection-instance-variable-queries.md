---
title: "introspection/instance_variable_queries.rb"
slug: introspection-instance-variable-queries
description: "The metorex example program introspection/instance_variable_queries.rb and its output."
---

`tests/_examples/introspection/instance_variable_queries.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/instance_variable_queries.rb){target=_blank rel=noopener}.

```metorex
class Greeter
  def initialize
    @greeting = "hello"
  end
end

module Marker
end

greeter = Greeter.new

puts greeter.instance_variable_defined?("@greeting")
puts greeter.instance_variable_defined?(:@greeting)
puts greeter.instance_variable_defined?("@goodbye")
puts greeter.instance_variable_defined?(:@goodbye)

begin
  greeter.instance_variable_defined?(Object.new)
rescue TypeError => error
  puts error.class
end

puts nil.instance_variable_defined?("@goodbye")
puts 1.instance_variable_defined?("@goodbye")
puts "text".instance_variable_defined?("@goodbye")

puts greeter.instance_of?(Greeter)
puts greeter.instance_of?(Object)
puts greeter.instance_of?(Marker)
puts greeter.instance_of?(Comparable)
```

Output:

```
true
true
false
false
TypeError
false
false
false
true
false
false
false
```
