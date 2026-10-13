---
title: "introspection/instance_variable_set_names_no_parens.rb"
slug: introspection-instance-variable-set-names-no-parens
description: "The metorex example program introspection/instance_variable_set_names_no_parens.rb and its output."
---

`tests/_examples/introspection/instance_variable_set_names_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/instance_variable_set_names_no_parens.rb).

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

puts greeter.instance_variable_set "@greeting", "hi"
puts greeter.instance_variable_set :@greeting, "hey"
puts greeter.instance_variable_set GreetingName.new, "howdy"
puts greeter.instance_variable_get :@greeting

emoji = Object.new
emoji.instance_variable_set :@💙, 42
puts emoji.instance_variable_get :@💙

["@", "@0", "@@greeting", "greeting"].each do |name|
  begin
    greeter.instance_variable_set(name, 1)
  rescue NameError => error
    puts "#{error.class}: #{error.message}"
  end
end

begin
  "".instance_variable_set(:greeting, 1)
rescue NameError => error
  puts "#{error.class}: #{error.message}"
end

begin
  nil.instance_variable_set(:@greeting, 1)
rescue FrozenError => error
  puts "#{error.class}: #{error.message}"
end

begin
  greeter.instance_variable_set(10, 1)
rescue TypeError => error
  puts "#{error.class}: #{error.message}"
end
```

Output:

```
hi
hey
howdy
howdy
42
NameError: `@' is not allowed as an instance variable name
NameError: `@0' is not allowed as an instance variable name
NameError: `@@greeting' is not allowed as an instance variable name
NameError: `greeting' is not allowed as an instance variable name
NameError: `greeting' is not allowed as an instance variable name
FrozenError: can't modify frozen NilClass: nil
TypeError: no implicit conversion of Integer into String
```
