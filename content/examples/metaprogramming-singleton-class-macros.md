---
title: "metaprogramming/singleton_class_macros.rb"
slug: metaprogramming-singleton-class-macros
description: "The metorex example program metaprogramming/singleton_class_macros.rb and its output."
---

`tests/_examples/metaprogramming/singleton_class_macros.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/singleton_class_macros.rb).

```metorex
module Macros
  def match(&block)
    define_method(:matches?) { |actual| block.call(actual) }
  end
end

class Matcher
  extend Macros

  def initialize(declarations)
    klass = class << self
      self
    end
    klass.class_exec(&declarations)
  end
end

odd = Matcher.new(proc { match { |actual| actual.odd? } })
p odd.matches?(3)
p odd.matches?(4)
p odd.singleton_class.instance_methods(false)
p Matcher.instance_methods(false)
```

Output:

```
true
false
[:matches?]
[]
```
