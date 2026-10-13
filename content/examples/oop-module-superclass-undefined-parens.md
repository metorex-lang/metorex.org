---
title: "oop/module_superclass/undefined_parens.rb"
slug: oop-module-superclass-undefined-parens
description: "The metorex example program oop/module_superclass/undefined_parens.rb and its output."
---

`tests/_examples/oop/module_superclass/undefined_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_superclass/undefined_parens.rb){target=_blank rel=noopener}.

```metorex
# A module has no superclass and does not answer `superclass`, while every
# class does.
module Greetings
end

puts(Greetings.respond_to?(:superclass))
begin
  Greetings.superclass
rescue NoMethodError => error
  puts(error.message)
end
puts(Class.new.superclass.inspect)
puts(BasicObject.superclass.inspect)
```

Output:

```
false
undefined method 'superclass' for module Greetings
Object
nil
```
