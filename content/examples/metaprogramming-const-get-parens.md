---
title: "metaprogramming/const_get_parens.rb"
slug: metaprogramming-const-get-parens
description: "The metorex example program metaprogramming/const_get_parens.rb and its output."
---

`tests/_examples/metaprogramming/const_get_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/const_get_parens.rb){target=_blank rel=noopener}.

```metorex
# Module#const_get — written with parentheses. Covers ancestor lookup,
# the inherit flag, scoped and toplevel-anchored names, const_missing
# dispatch, NameError#name, and paren-less lambda parameters.
module Lookup
  module Inc
    FROM_MODULE = :from_module
  end

  class Parent
    FROM_PARENT = :from_parent
  end

  class Child < Parent
    include Inc
  end

  class Handled
    def self.const_missing(name)
      [:missing, name]
    end
  end
end

TOP_CONST = :top

puts(Lookup::Child.const_get(:FROM_PARENT).inspect)
puts(Lookup::Child.const_get(:FROM_MODULE).inspect)
puts(Lookup::Child.const_get(:TOP_CONST).inspect)
puts(Lookup.const_get("Child::FROM_PARENT").inspect)
puts(Lookup.const_get("::TOP_CONST").inspect)
puts(Lookup::Handled.const_get(:ANYTHING).inspect)

inspect_error = ->(e) { puts(e.name.inspect) }
begin
  Lookup::Child.const_get(:FROM_PARENT, false)
rescue NameError => e
  inspect_error.call(e)
end

begin
  Lookup.const_get("no_caps")
rescue NameError
  puts("NameError")
end
```

Output:

```
:from_parent
:from_module
:top
:from_parent
:top
[:missing, :ANYTHING]
:FROM_PARENT
NameError
```
