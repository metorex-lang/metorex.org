---
title: "introspection/remove_instance_variable_no_parens.rb"
slug: introspection-remove-instance-variable-no-parens
description: "The metorex example program introspection/remove_instance_variable_no_parens.rb and its output."
---

`tests/_examples/introspection/remove_instance_variable_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/remove_instance_variable_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Greeter
  def initialize
    @greeting = "hello"
    @name = "world"
  end
end

greeter = Greeter.new
puts greeter.instance_variables.inspect
removed = greeter.remove_instance_variable :@greeting
puts removed.inspect
puts greeter.instance_variables.inspect
puts greeter.instance_variable_defined? :@greeting

removed_name = greeter.remove_instance_variable "@name"
puts removed_name.inspect
puts greeter.instance_variables.inspect

begin
  greeter.remove_instance_variable :@unknown
rescue NameError => error
  puts "#{error.class}: #{error.message}"
end

begin
  greeter.remove_instance_variable :"@0"
rescue NameError => error
  puts "#{error.class}: #{error.message}"
end

begin
  greeter.remove_instance_variable Object.new
rescue TypeError => error
  puts error.class
end

class Name
  def to_str
    "@greeting"
  end
end

reborn = Greeter.new
reborn_greeting = reborn.remove_instance_variable Name.new
puts reborn_greeting.inspect

frozen = Greeter.new
frozen.freeze
begin
  frozen.remove_instance_variable :@greeting
rescue FrozenError => error
  puts error.class
end

begin
  nil.remove_instance_variable :@anything
rescue FrozenError => error
  puts error.class
end

begin
  nil.remove_instance_variable :not_a_variable
rescue NameError => error
  puts error.class
end

puts Kernel.public_instance_methods(false).include? :remove_instance_variable
```

Output:

```
[:@greeting, :@name]
"hello"
[:@name]
false
"world"
[]
NameError: instance variable @unknown not defined
NameError: `@0' is not allowed as an instance variable name
TypeError
"hello"
FrozenError
FrozenError
NameError
true
```
