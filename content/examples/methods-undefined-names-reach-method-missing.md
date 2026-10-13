---
title: "methods/undefined_names_reach_method_missing.rb"
slug: methods-undefined-names-reach-method-missing
description: "The metorex example program methods/undefined_names_reach_method_missing.rb and its output."
---

`tests/_examples/methods/undefined_names_reach_method_missing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/undefined_names_reach_method_missing.rb){target=_blank rel=noopener}.

```metorex
class Blank
  undef_method :<=>
  undef_method :==

  def method_missing(name, *arguments)
    [:missing, name, *arguments]
  end

  def respond_to_missing?(*)
    true
  end
end

p Blank.new <=> 1
p Blank.new == 2
p Blank.new.__send__(:<=>, 3)

class Wrapper
  def method_missing(name, *arguments)
    [:missing, name, *arguments]
  end
end
p Wrapper.new < 4

module AnyStandardError
  def self.===(exception)
    exception.is_a?(StandardError)
  end
end

begin
  raise ArgumentError, "custom match"
rescue AnyStandardError => error
  p error.message
end

p([Blank.new, Blank.new].sort) rescue p $!.class

class Quiet
  undef_method :inspect

  def method_missing(name, *arguments)
    [:missing, name]
  end
end
p Quiet.new.inspect

class Plain
  undef_method :hash
end
Plain.new.hash rescue p $!.message

class Ordered
  def <=>(other)
    0
  end

  def method_missing(name, *arguments)
    [:missing, name, *arguments]
  end
end
p Ordered.new < 5
```

Output:

```
[:missing, :<=>, 1]
[:missing, :==, 2]
[:missing, :<=>, 3]
[:missing, :<, 4]
"custom match"
NoMethodError
[:missing, :inspect]
"undefined method 'hash' for an instance of Plain"
[:missing, :<, 5]
```
