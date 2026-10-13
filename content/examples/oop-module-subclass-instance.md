---
title: "oop/module_subclass_instance.rb"
slug: oop-module-subclass-instance
description: "The metorex example program oop/module_subclass_instance.rb and its output."
---

`tests/_examples/oop/module_subclass_instance.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_subclass_instance.rb){target=_blank rel=noopener}.

```metorex
class Namespace < Module
  attr_reader :label

  def initialize
    @label = :named
  end
end

space = Namespace.new
puts space.label.inspect
puts space.class.inspect
puts space.is_a?(Module).inspect
puts space.constants.inspect

space.const_set :LIMIT, 10
puts space.constants.inspect
puts space.const_get(:LIMIT).inspect

blank = Module.new do
  const_set :A, 'A'
end
puts blank.const_get('A').inspect
```

Output:

```
:named
Namespace
true
[]
[:LIMIT]
10
"A"
```
