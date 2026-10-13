---
title: "oop/extend_module.rb"
slug: oop-extend-module
description: "The metorex example program oop/extend_module.rb and its output."
---

`tests/_examples/oop/extend_module.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/extend_module.rb){target=_blank rel=noopener}.

```metorex
module Namespace
end

module Namespace::Taggable
  def tag
    "tagged"
  end
end

class Direct
  extend Namespace::Taggable
end

puts Direct.tag
puts Direct.kind_of?(Namespace::Taggable)

anonymous = Class.new do
  extend Namespace::Taggable
end

puts anonymous.tag
puts anonymous.kind_of?(Namespace::Taggable)

single = Object.new
single.extend Namespace::Taggable
puts single.tag
puts single.kind_of?(Namespace::Taggable)
puts Object.new.kind_of?(Namespace::Taggable)

begin
  Object.new.extend(Class.new)
rescue TypeError => error
  puts error.class
end

puts Object.new.method(:extend).arity
```

Output:

```
tagged
true
tagged
true
tagged
true
false
TypeError
-1
```
