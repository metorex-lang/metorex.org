---
title: "introspection/instance_variable_get_names.rb"
slug: introspection-instance-variable-get-names
description: "The metorex example program introspection/instance_variable_get_names.rb and its output."
---

`tests/_examples/introspection/instance_variable_get_names.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/instance_variable_get_names.rb){target=_blank rel=noopener}.

```metorex
class Greeter
  def initialize
    @greeting = "hello"
  end
end

class GreetingName
  def to_str
    "@greeting"
  end
end

greeter = Greeter.new

puts greeter.instance_variable_get("@greeting")
puts greeter.instance_variable_get(:@greeting)
puts greeter.instance_variable_get(GreetingName.new)
puts greeter.instance_variable_get(:@goodbye).inspect
puts nil.instance_variable_get(:@goodbye).inspect

["@", "@0", "@@greeting", "greeting"].each do |name|
  begin
    greeter.instance_variable_get(name)
  rescue NameError => error
    puts "#{error.class}: #{error.message}"
  end
end

begin
  greeter.instance_variable_get(10)
rescue TypeError => error
  puts "#{error.class}: #{error.message}"
end
```

Output:

```
hello
hello
hello
nil
nil
NameError: `@' is not allowed as an instance variable name
NameError: `@0' is not allowed as an instance variable name
NameError: `@@greeting' is not allowed as an instance variable name
NameError: `greeting' is not allowed as an instance variable name
TypeError: no implicit conversion of Integer into String
```
