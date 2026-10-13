---
title: "introspection/method_via_respond_to_missing.rb"
slug: introspection-method-via-respond-to-missing
description: "The metorex example program introspection/method_via_respond_to_missing.rb and its output."
---

`tests/_examples/introspection/method_via_respond_to_missing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/method_via_respond_to_missing.rb){target=_blank rel=noopener}.

```metorex
class Ghost
  def respond_to_missing?(name, include_private = false)
    name == :haunt || (name == :whisper && include_private)
  end

  def method_missing(name, *args)
    "called #{name} with #{args.inspect}"
  end
end

ghost = Ghost.new
haunt = ghost.method(:haunt)
puts haunt.class.name
puts haunt.call
puts haunt.call(1, 2)
puts ghost.method(:whisper).call("softly")

begin
  ghost.method(:unknown)
rescue NameError => error
  puts "#{error.class}: #{error.message}"
end

class OneArgumentMissing
  def respond_to_missing?(name, include_private = false)
    name == :only_name
  end

  def method_missing(name)
    name
  end
end

puts OneArgumentMissing.new.method(:only_name).call.inspect

begin
  OneArgumentMissing.new.method(:only_name).call(1)
rescue ArgumentError => error
  puts error.class
end

class Named
  def to_str
    "upcase"
  end
end

puts "shout".method(Named.new).call

begin
  "shout".method(nil)
rescue TypeError => error
  puts "#{error.class}: #{error.message}"
end
```

Output:

```
Method
called haunt with []
called haunt with [1, 2]
called whisper with ["softly"]
NameError: undefined method 'unknown' for class 'Ghost'
:only_name
ArgumentError
SHOUT
TypeError: no implicit conversion of Object into String
```
