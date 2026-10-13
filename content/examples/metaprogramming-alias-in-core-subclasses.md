---
title: "metaprogramming/alias_in_core_subclasses.rb"
slug: metaprogramming-alias-in-core-subclasses
description: "The metorex example program metaprogramming/alias_in_core_subclasses.rb and its output."
---

`tests/_examples/metaprogramming/alias_in_core_subclasses.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/alias_in_core_subclasses.rb){target=_blank rel=noopener}.

```metorex
# A class below a core class gives a second name to a method the core class
# answers natively, with alias or alias_method.
class Keys < Hash
  alias_method(:each_name, :each_key)
end

Keys[{ a: 1, b: 2 }].each_name { |name| p(name) }

class List < Array
  alias count_of size
  alias pick fetch
  alias every each
end

list = List.new([5, 6])
p(list.count_of, list.pick(1), list.pick(9, :none))
list.every { |item| p(item) }

class Text < String
  alias shout upcase
end

p(Text.new("hi").shout)
```

Output:

```
:a
:b
2
6
:none
5
6
"HI"
```
